//
//  TransactionDetailView.swift
//  Dollar
//
//  Created by Pranav Burugula on 11/18/22.
//

import SwiftUI

struct TransactionDetailView: View {
    let transaction: Transaction
    
    var body: some View {
        GeometryReader { geometry in
            Spacer()
            VStack(alignment: .leading) {
                
                Group {
                    Spacer().frame(height: 15)
                    Text(transaction.description)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                }
                
                Spacer().frame(height: 40)
                
                Group {
                    Text("Status").font(.title)
                    HStack {
                        Text(transaction.entityFrom)
                        Spacer()
                        ZStack {
                            Line().stroke((transaction.status == Transaction.Status.delivered) ? Color.green : ((transaction.status == Transaction.Status.sent) ? Color.orange : Color.red), style: StrokeStyle(lineWidth: 1, dash: (transaction.status == Transaction.Status.delivered) ? [] : [5]))
                                .frame(height: 1)
                            
                            if transaction.status == Transaction.Status.delivered {
                                Image("ArrowHead").resizable().renderingMode(.original).frame(width: 20, height: 20).padding([.leading], geometry.size.width * 0.5)
                            } else if transaction.status != Transaction.Status.cancelled {
                                Image("ArrowHead").resizable().renderingMode(.original).frame(width: 20, height: 20).padding([.trailing], geometry.size.width * ((transaction.status == Transaction.Status.pending) ? 0.5 : 0))
                            }
                        }
                        Spacer()
                        Text(transaction.entityTo)
                    }
                }
                
                Spacer().frame(height: 40)
                
                Group {
                    Text("Info").font(.title)
                    Spacer().frame(height: 15)
                    
                    HStack {
                        Text("Amount:")
                            .font(.headline)
                        Text(String(transaction.amount))
                    }
                    HStack {
                        Text("Budget:")
                            .font(.headline)
                        Text(transaction.budget)
                    }
                    HStack {
                        Text("Group:")
                            .font(.headline)
                        Text(transaction.group)
                    }
                    
                    HStack {
                        Button(action: {
                            print("Upload button pressed")
                        }) {
                            VStack {
                                Image("UploadIcon").resizable().frame(width: 50, height: 50)
                                Text("Receipt")
                            }
                        }
                    }.padding([.leading], geometry.size.width * 0.5 - 50)
                }
                
                Spacer().frame(height: 40)
                
                Group {
                    Text("Actions").font(.title)
                    Spacer().frame(height: 15)
                    
                    HStack {
                        Button(action: {
                            print("Delete button pressed")
                        }) {
                            VStack {
                                Image("DeleteIcon").resizable().frame(width: 50, height: 50)
                                Text("Delete")
                            }
                        }
                        Spacer()
                        Button(action: {
                            print("Edit button pressed")
                        }) {
                            VStack {
                                Image("EditIcon").resizable().frame(width:50, height: 50)
                                Text("Edit")
                            }
                        }
                    }.padding([.leading, .trailing], geometry.size.width * 0.33 - 50)
                }
            }.frame(width: geometry.size.width - 40)
            .padding([.leading, .trailing], 20)
            .navigationTitle(transaction.itemName)
        }
    }
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

struct TransactionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionDetailView(transaction: Transaction.sample)
    }
}

