Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE4CC4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 29 Oct 2023 21:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 377BE43113;
	Sun, 29 Oct 2023 21:23:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 377BE43113
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=e6FVjIVa
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mhhlOR31unKi; Sun, 29 Oct 2023 21:23:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A86A24309B;
	Sun, 29 Oct 2023 21:23:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A86A24309B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84E31C0039;
	Sun, 29 Oct 2023 21:23:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD458C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 21:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7699770632
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 21:23:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7699770632
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=e6FVjIVa
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9kbtm6yjd2IJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 21:23:39 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04olkn0822.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::822])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A692D7037F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 21:23:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A692D7037F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwBUCHu3Xg/cmieRr8RM3bIqXlJzMtkJ5CXUQrXvn1kt/dzP5mCoTDCJwyHh9h8kNUS52cIhvSQByRDVZ/dkuvmlxfODdnlpmXqIQ37MRcneikN4/tcdt9bPIQ29+gPdyDIp7BGQw0uh0mPmczp/B8k4LUCK9V8LZWasAwfAGDM4985nHOu8Q46kYd9LPVdVammrmsS++7Fqqxt7ZyXQzzZ891oy3VgNSgfeedA3h3MYkgj9rdyS1Thmp3SZoM3Ov2Jv9M8GdYnpcCgN4nZcI83x5JZP5n/k3cfXzohXQ4W30iGJWuSVBnSYbV1CScbb+vsP+zqyVxn2/pCWMiufqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6M0B9NbUlgDJsAPGo584eNpJCi4+0ld3rxL+zjZdXFI=;
 b=JhV+WnxQmzSwrRKNcwR+AcpcbwKTO/CHgUD6Qbs8mnUTcoxJfj9m7XipoVVAFm+cz1y6yPZ/1NW/MWmHo4mKxbXQruond4InvpboI5PKkJbv8N1H8kaK1rLtpan8hC2ZYfskel/01bILnudzzR4L+Fe/0HA9hWBur0ChrQojgg+09kCQR0HtlD5RI+Tvcqacp+PwrVkfNEWxRPQ2ZlRi+vgy9fqC2Ql8+3TsAo1tOfVEdhm0ahUKHA5N27vEN9/CFU5qnwbCKw/SvlU60txEGACUlKir17zUz3WCJD8zP5STCfloGngtn7MI7C3OcvrH6DbVN7kI0yEoLK/d7ci3wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6M0B9NbUlgDJsAPGo584eNpJCi4+0ld3rxL+zjZdXFI=;
 b=e6FVjIVacPzOb624JMFzfESIvfwGGKlZDJcEhl5pXVcDC5ll0/qTV2Qf90RP4eTVWujG8wbPunpNFrVoJI/FlSLgBJ9+wqFgpNc3hutn+Pideha5XwQSH/ycwPjGYv8UkCKAOB5loITsQtKAuS58A+Fw4tRwIz6TLBBuB5ymAUTd/IgBO5pv19fEVhURmwLa7Fu0jpvw3HgAdFWV221fcO2c74hM/ZYov5fUizz7z1BW/gQG88hQIG+17GoMHdhY+GssoLCBfpmdf/cJ8eX7Z1MM9jRyn3b2ZZizolEsYOeSalNFKLoL6lqEqg2G6UZOucQ6PMjrwfYh3GnuLD5zjQ==
Received: from VI1P193MB0752.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:32::19)
 by DB9P193MB1931.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:24e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.27; Sun, 29 Oct
 2023 21:23:35 +0000
Received: from VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 ([fe80::2db3:2c11:bb43:c6e]) by VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 ([fe80::2db3:2c11:bb43:c6e%5]) with mapi id 15.20.6933.027; Sun, 29 Oct 2023
 21:23:35 +0000
Message-ID: <VI1P193MB0752CD67E1432A1CDE48F86D99A2A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
Date: Mon, 30 Oct 2023 05:23:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/cgroup: Fix awk usage in test_cpuset_prs.sh
 that may cause error
To: Waiman Long <longman@redhat.com>, lizefan.x@bytedance.com, tj@kernel.org, 
 hannes@cmpxchg.org, shuah@kernel.org
References: <VI1P193MB07522BFC89B6B6DC5A89153999FCA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
 <ed2993f2-4bdc-19c5-5a0f-1e96da44fb24@redhat.com>
From: Juntong Deng <juntong.deng@outlook.com>
In-Reply-To: <ed2993f2-4bdc-19c5-5a0f-1e96da44fb24@redhat.com>
X-TMN: [zdfF4qpzxzr+6SiiYHdzaUZF2YASsHQ+]
X-ClientProxiedBy: CWLP123CA0111.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:5f::27) To VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:32::19)
X-Microsoft-Original-Message-ID: <d6daf8c0-c827-400f-87d8-5b69eae09e62@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0752:EE_|DB9P193MB1931:EE_
X-MS-Office365-Filtering-Correlation-Id: a36c9e27-601f-4d41-6a56-08dbd8c54f37
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 27CvvH7Z26NIY5nxCE8+eLM+zNYGonPlm5/329EfLOM0aMfZugofsKKL5BAnStSGipZJWNCM04CszHvQ2pFsujnl7e/MirMBW5aPFxVZLyjXxm6UDJMC8zIGSw0Sf7oDiGEkNsjLf9pqswOgB1eHIPr4xXyuXqKE4R6jF7Wgg4FzA3mwFkVhrgL67KjEul4p+BtcREd90t5ccyXnldUXi24cZt5endn0wq/4423NS3jKCw7ywGnQ8Gi9sTTVig+YMnJyE1c5cn+xRbuz7cM7HXU2mWMFfPp/cugdSc2YhMYAubrX4wDwaO9DJBm3Ty7RxZwiMOYLzdnCazE+/d6SoVcKH4xDExHEjYUuy3hoHcEKGaLoC7gN7NiA/nGamlVPIPaisfC/QL+49JMsnJEGBlsqkpmwfnuq56oDGnfydxuK7vVXm7STU34LdShEOiSZauTvKOO5eHYJwrYUTMu7dqmSaNXhFhFOTGCFMaug0o4xTMhMRvZj14KY0mVzARU/LXFoKx+xvEz4ODgYD9UrCpSfoAQXh2KXCeNP0ypiyaYcnxZeOJC0ugaLrKkls2W8
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmlhMkhWd2N2MHVla0hNTWI1b2xuR0NjcTBXRFNTQ2FmOTBhVjY3Z1NtL2Zj?=
 =?utf-8?B?QXIweVF4cVFvdHJJM3dTUkUxR2EzajVxSGZRUTZWVEd5MElUaUVOQ3kvOUZS?=
 =?utf-8?B?elhqbGswMnZqTTR0UU8yQWNzREhXczhkRzJrZlRvcE5VQUFVTTJNUmVTTmVo?=
 =?utf-8?B?WGlzN2wzUjZJZjBldHlGSUNLZUZQczRJSHl3RFhlK3drdVRIRTdYcElOTmM0?=
 =?utf-8?B?ZU5XejN4OFFodjBxVG44TUIvUmVESFBENUcydmpaQkhwSWd0OUFEbjdYNnhK?=
 =?utf-8?B?dkdQaUFDSVYrMHFtTGZTL3VMVldlcTE5clZ2bWlINXZEYTRlK3BXQ2krVVJk?=
 =?utf-8?B?N3hGZ29YNTBLbkwwWUFobjYvQ2ZhZi9USjBkb29FbzNEb3RpVklEVWhQNGUy?=
 =?utf-8?B?OU9oUy9XWmw4eEtOdVZ0emlLc2JWZHM2V2hpbGZSamUzQkJ4TUR0WjJhNkZS?=
 =?utf-8?B?Zk5YTy83MDVuWEVaRDNkc084NE1PM0VCdVFVL1g2cG1xM1ErZWJqa3R4MnlC?=
 =?utf-8?B?L29TQ3RMdXJidTR0eWhUbFR5bkRyaXNOMDBKb1BVZGZabzVrUEZ1V2VIYmlL?=
 =?utf-8?B?U0prVFJsYVdNaW1Hckk3SFBGa1NvN2ZNUnE5cXJFNnVtc1BsL1BDTWVzRmZu?=
 =?utf-8?B?ZVpwM3J4WmdjMnl5bTVJcGVDR1VLWC9OMVdxWXh0eFRTbHd3b3AyUHJNeUpr?=
 =?utf-8?B?dXJHSXFsWXVySkQ2WWNTNmdBQXVDSlgwaENlMDVOblE3QXd6T3FlaHEvcHkz?=
 =?utf-8?B?cytqU3A3TzY5Z3BRSWtZMGFaTGZxQ1pPQ1I0THNQVVFINWpueWZIaHZ5Sjc3?=
 =?utf-8?B?cHJ2R1p5K2Rvc2lGWkplYXVlWDVMdmJXclNvRk9DS1FzL0xxMVZrWXR6NGx5?=
 =?utf-8?B?SGtJcDhOSDlOZDdXRmwwQ2U4SUI4cWZzYzNkbldJK1FYWU9zSUtiMWFRemRC?=
 =?utf-8?B?a21VTkRLYVNCeGZYV0ZHaTJBc09qcXppaVdZNVZEVFkzWVFnRThNY1J0Tll0?=
 =?utf-8?B?bk9qRVhRNHZWVldyMzhWeVRVTUNIbEJlbzhmK1JuWEFCR1Zrc3E0SlhPWmxL?=
 =?utf-8?B?TEZXN1F0ZEZSdGdKb0lRV29RaFhpKzhhTzEzWWxWdjByR3NSeDdGaUlhaExl?=
 =?utf-8?B?c3J5RGdIRnVINVlmbDNZc2xiNmtYRzdHMWlnYU9xMUhiZStQbXBMTStYbTI2?=
 =?utf-8?B?Mkxxb0pCaWdNdDI0MTdVb0pQbExSTGZET0kxS1FabEdzbU81aTN4MWsxdjZm?=
 =?utf-8?B?Z2tlajdTZFFJV3ZBWWxRTCtBc25FWU55a2llSkMxN2Z4WjZOU0xIMnVlem10?=
 =?utf-8?B?bG5UOG5rQnRmT283U3JldFdpWUVMcTI1Yk9NTDM5OHBXZE1IUkpHekgxckZX?=
 =?utf-8?B?Z2VHZzIvUDByNDhOR0FRbkNlT0RsaDdReGZxbTdJREF3RW52YzJzbDBSczY3?=
 =?utf-8?B?U3JOVllCMWdKazRtbC9JL3kvK2JGSjQvb2ZhUldtSjZKUzNVeXhBb2RHMEEr?=
 =?utf-8?B?V3BvV0RQTzlqWlM3RjlQTEJFUWM3VUJHMHAzZjlWdGtERk9HbGxEWjd4T0xk?=
 =?utf-8?B?S3djS0VBb1V3YmFjd3E4eHk3Zyt4Ny9WV0pyUHZ2Mko2bTNXM2ZrSzMzVG9p?=
 =?utf-8?Q?F/ZOhMeutXh5GCw9T/Fzr6vWR8y1WTK0IPkZ6TqzDg2s=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a36c9e27-601f-4d41-6a56-08dbd8c54f37
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2023 21:23:35.4898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P193MB1931
Cc: cgroups@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gMjAyMy85LzI2IDIwOjE4LCBXYWltYW4gTG9uZyB3cm90ZToKPiBPbiA5LzI1LzIzIDE1OjM4
LCBKdW50b25nIERlbmcgd3JvdGU6Cj4+IEFjY29yZGluZyB0byB0aGUgYXdrIG1hbnVhbCwgdGhl
IC1lIG9wdGlvbiBkb2VzIG5vdCBuZWVkIHRvIGJlIHNwZWNpZmllZAo+PiBpbiBmcm9udCBvZiAn
cHJvZ3JhbScgKHVubGVzcyB5b3UgbmVlZCB0byBtaXggcHJvZ3JhbS1maWxlKS4KPj4KPj4gVGhl
IHJlZHVuZGFudCAtZSBvcHRpb24gY2FuIGNhdXNlIGVycm9yIHdoZW4gdXNlcnMgdXNlIGF3ayB0
b29scyBvdGhlcgo+PiB0aGFuIGdhd2sgKGZvciBleGFtcGxlLCBtYXdrIGRvZXMgbm90IHN1cHBv
cnQgdGhlIC1lIG9wdGlvbikuCj4+Cj4+IEVycm9yIEV4YW1wbGU6Cj4+IGF3azogbm90IGFuIG9w
dGlvbjogLWUKPj4gQ2dyb3VwIHYyIG1vdW50IHBvaW50IG5vdCBmb3VuZCEKPj4KPj4gU2lnbmVk
LW9mZi1ieTogSnVudG9uZyBEZW5nIDxqdW50b25nLmRlbmdAb3V0bG9vay5jb20+Cj4+IC0tLQo+
PiDCoCB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9jZ3JvdXAvdGVzdF9jcHVzZXRfcHJzLnNoIHwg
MiArLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
Pj4KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Nncm91cC90ZXN0X2Nw
dXNldF9wcnMuc2ggCj4+IGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvY2dyb3VwL3Rlc3RfY3B1
c2V0X3Bycy5zaAo+PiBpbmRleCA0YWZiMTMyZTRlNGYuLjY4MjA2NTNlODQzMiAxMDA3NTUKPj4g
LS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvY2dyb3VwL3Rlc3RfY3B1c2V0X3Bycy5zaAo+
PiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9jZ3JvdXAvdGVzdF9jcHVzZXRfcHJzLnNo
Cj4+IEBAIC0yMCw3ICsyMCw3IEBAIHNraXBfdGVzdCgpIHsKPj4gwqAgV0FJVF9JTk9USUZZPSQo
Y2QgJChkaXJuYW1lICQwKTsgcHdkKS93YWl0X2lub3RpZnkKPj4gwqAgIyBGaW5kIGNncm91cCB2
MiBtb3VudCBwb2ludAo+PiAtQ0dST1VQMj0kKG1vdW50IC10IGNncm91cDIgfCBoZWFkIC0xIHwg
YXdrIC1lICd7cHJpbnQgJDN9JykKPj4gK0NHUk9VUDI9JChtb3VudCAtdCBjZ3JvdXAyIHwgaGVh
ZCAtMSB8IGF3ayAne3ByaW50ICQzfScpCj4+IMKgIFtbIC1uICIkQ0dST1VQMiIgXV0gfHwgc2tp
cF90ZXN0ICJDZ3JvdXAgdjIgbW91bnQgcG9pbnQgbm90IGZvdW5kISIKPj4gwqAgQ1BVUz0kKGxz
Y3B1IHwgZ3JlcCAiXkNQVShzKToiIHwgc2VkIC1lICJzLy4qOltbOnNwYWNlOl1dKi8vIikKPiAK
PiBZZXMsIHRoZSAtZSBvcHRpb24gaXMgcmVkdW5kYW50LiBUaGFua3MgZm9yIGNhdGNoaW5nIHRo
YXQuCj4gCj4gQWNrZWQtYnk6IFdhaW1hbiBMb25nIDxsb25nbWFuQHJlZGhhdC5jb20+Cj4gCgpI
aSBTaHVhaCwgdGhpcyBwYXRjaCBoYXMgYmVlbiBhY2tlZCBidXQgZG9lcyBub3Qgc2VlbSB0byBo
YXZlIGJlZW4KYXBwbGllZCB5ZXQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJu
ZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhm
b3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
