# -*- coding: utf-8 -*-
import pandas as pd
import os
from glob import glob
###########################################################################
## Python code generated with wxFormBuilder (version Jun 17 2015)
## http://www.wxformbuilder.org/
##
## PLEASE DO "NOT" EDIT THIS FILE!
###########################################################################

import wx
import wx.xrc


###########################################################################
## Class MyFrame4
###########################################################################

class MovieDB(wx.Frame):

    def __init__(self, parent):
        wx.Frame.__init__(self, parent, id=wx.ID_ANY, title=wx.EmptyString, pos=wx.DefaultPosition,
                          size=wx.Size(693, 346), style=wx.DEFAULT_FRAME_STYLE | wx.TAB_TRAVERSAL)

        #self.SetSizeHintsSz(wx.DefaultSize, wx.DefaultSize)

        bSizer15 = wx.BoxSizer(wx.VERTICAL)

        self.m_panel12 = wx.Panel(self, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL)
        bSizer16 = wx.BoxSizer(wx.HORIZONTAL)

        self.m_staticText13 = wx.StaticText(self.m_panel12, wx.ID_ANY, u"영화 제목", wx.DefaultPosition, wx.DefaultSize, 0)
        self.m_staticText13.Wrap(-1)
        bSizer16.Add(self.m_staticText13, 0, wx.ALL | wx.ALIGN_CENTER_VERTICAL, 5)

        # 콤보박스 부분 코딩
        m_cbMovieChoices = []
        os.chdir("C:\\GitTest\\Moviewithprice")
        m_list = glob('*.csv') # csv 붙은것 모두 가져온다.ㅋ 이름이 가져와지지만 .csv제거 필요
        for i in m_list:
            m_cbMovieChoices.append(i[:-4])



        self.m_cbMovie = wx.ComboBox(self.m_panel12, wx.ID_ANY, u"영화 제목 선택", wx.DefaultPosition, wx.DefaultSize,
                                     m_cbMovieChoices, 0)
        bSizer16.Add(self.m_cbMovie, 1, wx.ALL | wx.ALIGN_CENTER_VERTICAL, 5)

        self.m_btnView = wx.Button(self.m_panel12, wx.ID_ANY, u"조회", wx.DefaultPosition, wx.DefaultSize, 0)
        bSizer16.Add(self.m_btnView, 0, wx.ALL | wx.ALIGN_CENTER_VERTICAL, 5)

        self.m_panel12.SetSizer(bSizer16)
        self.m_panel12.Layout()
        bSizer16.Fit(self.m_panel12)
        bSizer15.Add(self.m_panel12, 0, wx.EXPAND | wx.ALL, 5)

        self.m_panel14 = wx.Panel(self, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL)
        bSizer18 = wx.BoxSizer(wx.HORIZONTAL)

        self.m_staticText15 = wx.StaticText(self.m_panel14, wx.ID_ANY, u"원하는 컬럼 추가", wx.DefaultPosition, wx.DefaultSize,
                                            0)
        self.m_staticText15.Wrap(-1)
        bSizer18.Add(self.m_staticText15, 0, wx.ALL, 5)

        self.m_ckScreenp = wx.CheckBox(self.m_panel14, wx.ID_ANY, u"스크린점유율", wx.DefaultPosition, wx.DefaultSize, 0)
        bSizer18.Add(self.m_ckScreenp, 0, wx.ALL, 5)

        self.m_ckPlayp = wx.CheckBox(self.m_panel14, wx.ID_ANY, u"상영점유율", wx.DefaultPosition, wx.DefaultSize, 0)
        bSizer18.Add(self.m_ckPlayp, 0, wx.ALL, 5)

        # 가격 체크박스 추가?
        self.m_ckPrice = wx.CheckBox(self.m_panel14, wx.ID_ANY, u"가격", wx.DefaultPosition, wx.DefaultSize, 0)
        bSizer18.Add(self.m_ckPrice, 0, wx.ALL, 5)

        self.m_panel14.SetSizer(bSizer18)
        self.m_panel14.Layout()
        bSizer18.Fit(self.m_panel14)
        bSizer15.Add(self.m_panel14, 0, wx.EXPAND | wx.ALL, 5)

        self.m_panel13 = wx.Panel(self, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL)
        bSizer17 = wx.BoxSizer(wx.VERTICAL)

        self.m_lstView = wx.ListCtrl(self.m_panel13, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.LC_REPORT)
        bSizer17.Add(self.m_lstView, 1, wx.ALL | wx.EXPAND, 5)

        # ListView의 필드명 작성.
        self.m_lstView.InsertColumn(0, "날짜", width=100)
        self.m_lstView.InsertColumn(1, "관객수", width=100)
        self.m_lstView.InsertColumn(2, "누적관객수", width=100)

        # insert columns 체크해서 하나씩 증가해야 한다. 체크박스 이벤트에 각각 있어야 자리 차지 없이 안밀림.
        # self.m_lstView.InsertColumn(3, "스크린점유율", width=100)
        # self.m_lstView.InsertColumn(4, "상영점유율", width=100)
        # self.m_lstView.InsertColumn(5, "가격", width=100)

        self.m_panel13.SetSizer(bSizer17)
        self.m_panel13.Layout()
        bSizer17.Fit(self.m_panel13)
        bSizer15.Add(self.m_panel13, 1, wx.EXPAND | wx.ALL, 5)

        self.SetSizer(bSizer15)
        self.Layout()

        self.Centre(wx.BOTH)

        # Connect Events
        self.m_btnView.Bind(wx.EVT_BUTTON, self.OnBtnView)
        self.m_ckScreenp.Bind(wx.EVT_CHECKBOX, self.OnCheckScreenp)
        self.m_ckPlayp.Bind(wx.EVT_CHECKBOX, self.OnCheckPlayp)
        self.m_ckPrice.Bind(wx.EVT_CHECKBOX, self.OnCheckPrice)

        global Screenpcnt
        Screenpcnt = None

    def OnBtnView(self, e):
        # 추가로 출력 위해서 index 변수 글로벌 선언
        global index
        self.m_lstView.DeleteAllItems()

        name = self.m_cbMovie.GetValue()
        #print(name) # ("C:\\GitTest\\Moviewithprice")
        moviedb = pd.read_csv(f"C:\\GitTest\\Moviewithprice\\{name}.csv")

        colCount = self.m_lstView.GetColumnCount()

        for j in moviedb.index:
            # 기본으로 출력되는 부분.
            index = self.m_lstView.InsertItem(1000, moviedb.iloc[j, 0])
            self.m_lstView.SetItem(index, 1, str(moviedb.iloc[j, 10]))
            self.m_lstView.SetItem(index, 2, str(moviedb.iloc[j, 13]))

        # if self.OnCheckScreenp(e): # 체크표시면 트루 리턴?
        #     for i in moviedb.index:
        #         # 추가로 출력되는 부분.
        #         self.m_lstView.SetItem(index, 3, str(round(moviedb.iloc[i, 2]*100, 2)))  # 스크린점유율

            # 체크표시 되어 있을때만 출력 되야 한다.
            # but 그러면 반복에 문제 생겨서 마지막 1줄만.
            # self.m_lstView.SetItem(index, 3, str(round(moviedb.iloc[j, 2]*100, 2)))  # 스크린점유율
            # self.m_lstView.SetItem(index, 4, str(round(moviedb.iloc[j, 4]*100, 2)))  # 상영점유율
            # self.m_lstView.SetItem(index, 5, str(moviedb.iloc[j, -1]))

            #self.m_lstView.SetItem(index, 3, str(round(moviedb.iloc[i, 2]*100, 2)))  # 스크린점유율
            #self.m_lstView.SetItem(index, 4, str(round(moviedb.iloc[i, 4]*100, 2)))  # 상영점유율
            #self.m_lstView.SetItem(index, 5, str(moviedb.iloc[i, -1]))


    def OnCheckScreenp(self, e): # 켜져있으면 인자 전달, View에서 if문으로 추가.

        if e.IsChecked(): # true 이면

            Screenpcnt = self.m_lstView.ColumnCount  # 0부터 시작. 개수에서 바로 사용
            self.m_lstView.InsertColumn(Screenpcnt, "스크린점유율", width=100)
            print(Screenpcnt)
        else:
            colCount = self.m_lstView.GetColumnCount()

            # Iterate over the columns and find the one with the matching name
            for i in range(colCount):
                colLabel = self.m_lstView.GetColumn(i).GetText()
                if colLabel == "스크린점유율":
                    # Delete the column
                    self.m_lstView.DeleteColumn(i)
                    return True

            # If the column was not found, return False
            return False

    def OnCheckPlayp(self, e):

        if e.IsChecked():
            #print(self.m_lstView.ColumnCount)
            # 기존 0 1 2 3로 총 4개
            Playpcnt = self.m_lstView.ColumnCount # 4로 저장.
            self.m_lstView.InsertColumn(Playpcnt, "상영점유율", width=100)
        else:
            # Get the number of columns
            colCount = self.m_lstView.GetColumnCount()

            # Iterate over the columns and find the one with the matching name
            for i in range(colCount):
                colLabel = self.m_lstView.GetColumn(i).GetText()
                if colLabel == "상영점유율":
                    # Delete the column
                    self.m_lstView.DeleteColumn(i)
                    return True

            # If the column was not found, return False
            return False


    def OnCheckPrice(self, e): # 켜져있으면 인자 전달, View에서 if문으로 추가.

        if e.IsChecked(): # true 이면
            #Screenpcnt = self.m_lstView.ColumnCount  # 0부터 시작. 개수에서 바로 사용
            self.m_lstView.InsertColumn(self.m_lstView.ColumnCount, "가격", width=100)
            return True
        else:
            colCount = self.m_lstView.GetColumnCount()

            # Iterate over the columns and find the one with the matching name
            for i in range(colCount):
                colLabel = self.m_lstView.GetColumn(i).GetText()
                if colLabel == "가격":
                    # Delete the column
                    self.m_lstView.DeleteColumn(i)
                    return True

            # If the column was not found, return False
            return False




if __name__ == "__main__":
    app = wx.App()
    MovieDB(None).Show()
    app.MainLoop()


