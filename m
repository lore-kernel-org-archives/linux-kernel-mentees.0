Return-Path: <SRS0=12iz=PX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E85C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  4 Nov 2021 14:51:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5309061059
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  4 Nov 2021 14:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5309061059
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cectek.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17DAE405BA;
	Thu,  4 Nov 2021 14:51:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qhUOXmAHdPLu; Thu,  4 Nov 2021 14:51:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 36C26405BC;
	Thu,  4 Nov 2021 14:51:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A982C0019;
	Thu,  4 Nov 2021 14:51:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 35236C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Nov 2021 14:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 114AA405BA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Nov 2021 14:51:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pWJRSUnjDKLG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Nov 2021 14:51:41 +0000 (UTC)
X-Greylist: delayed 00:23:59 by SQLgrey-1.8.0
Received: from lotus_srv1.cectek.com (unknown [122.147.213.144])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE478405B9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Nov 2021 14:51:40 +0000 (UTC)
Received: from [127.0.0.1] ([191.53.195.120])
 by lotus_srv1.cectek.com (Lotus Domino Release 8.5.3FP6 HF3175)
 with ESMTP id 2021110422273208-5094 ; Thu, 4 Nov 2021 22:27:32 +0800 
Subject: Here is the last warning! Your information has been compromised!
 The entry in system is completed.
To: linux-kernel-mentees@lists.linuxfoundation.org
Date: Thu, 4 Nov 2021 17:27:30 +0300
From: <sandy@cectek.com>
Message-ID: <GmfKHKcToyTfkYt-LRyqmZcvjMmeYjaWIPOd-QmiYrLqWyPnVDtsyYtykZ-HpUzotCIGfQKfgMSnjs@cectek.com>
Form-Sub: v=2; ip=160.78.159.133
Accept-Language: en-US
X-MIMETrack: =?Big5?B?SXRlbWl6ZSBieSBTTVRQIFNlcnZlciBvbiBsb3R1c19zcnYxL0NFQyhSZWxlYXNl?=
 =?Big5?B?IDguNS4zRlA2IEhGMzE3NXxBcHJpbCAyOCwgMjAxNykgYXQgMjAyMS8xMS8wNA==?=
 =?Big5?B?IKRVpMggMTA6Mjc6MzU=?=,
 =?Big5?B?U2VyaWFsaXplIGJ5IFJvdXRlciBvbiBsb3R1c19zcnYxL0NFQyhSZWxlYXNl?=
 =?Big5?B?IDguNS4zRlA2IEhGMzE3NXxBcHJpbCAyOCwgMjAxNykgYXQgMjAyMS8xMS8wNA==?=
 =?Big5?B?IKRVpMggMTA6NTE6NDA=?=,
 =?Big5?B?U2VyaWFsaXplIGNvbXBsZXRlIGF0IDIwMjEvMTEvMDQgpFWkyCAxMDo1MTo0MA==?=
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

R29vZCBkYXkuIFlvdXIgIHN5c3RlbSBoYXMgIGJlZW4gaGFja2VkICB3aXRoIGEgIFRyb2phbiB2
aXJ1cy4gSXQgIGhhcyBwZW5ldHJhdGVkICB5b3VyIGRldmljZSAgdGhyb3VnaCBhZHVsdCBwb3J0
YWxzICB3aGljaCB5b3UgIHNvbWV0aW1lcyB2aXNpdC4gU29tZSAgc3BpY3kgdmlkZW9zICBjb250
YWluIG1hbGljaW91cyAgY29kZSB0aGF0ICBhY3RpdmF0ZXMgYWZ0ZXIgIGJlaW5nIHR1cm5lZCAg
b24uIFlvdXIgIGVudGlyZSBpbmZvcm1hdGlvbiAgaGFzIGFscmVhZHkgIGJlZW4gY29waWVkIHRv
ICBteSBzZXJ2ZXJzLiAKCgoKSSAgcG9zc2VzcyBjb21wbGV0ZSAgY29udHJvbCBvdmVyICB5b3Vy
IGRldmljZSAgd2hpY2ggeW91ICB1c2UgdG8gIGFjY2VzcyB0aGUgIEludGVybmV0LiBJIGNhbiAg
c2VlIHlvdXIgIHNjcmVlbiwgSSAgY2FuICB1c2UgYSAgbWljcm9waG9uZSBhbmQgIGEgY2FtZXJh
ICBpbiBhICB3YXkgdGhhdCAgeW91IG5ldmVyICBub3RpY2UgYW55dGhpbmcuICAgCgoKSSd2ZSAg
YWxyZWFkeSBtYWRlICBhIHNjcmVlbiAgcmVjb3JkaW5nLiBBIHZpZGVvIHdhcyAgZWRpdGVkIHdp
dGggIGEgcG9ybm9ncmFwaGljICBtb3ZpZSB0aGF0ICB5b3Ugd2VyZSAgd2F0Y2hpbmcgYXQgIHRo
YXQgdGltZSAgYW5kIG1hc3R1cmJhdGluZy4gIAoKCllvdXIgZmFjZSAgaXMgcGVyZmVjdGx5ICB2
aXNpYmxlIGFuZCAgSSAgZG9u4oCZdCB0aGluayAgdGhhdCB0aGlzICBraW5kIG9mICBjb250ZW50
IHdpbGwgIGhhdmUgYSAgcG9zaXRpdmUgaW1wYWN0ICBvbiB5b3VyICByZXB1dGF0aW9uLiAKCgpJ
ICBoYXZlIGFuICBvdmVyYWxsIGFjY2VzcyAgdG8geW91ciAgbGlzdCAgb2YgY29udGFjdHMgIGFu
ZCB0aGUgIHNvY2lhbCBtZWRpYSAgcHJvZmlsZXMuIEkgIGNhbiBzZW5kICB0aGlzIHZpZGVvICBm
cm9tIHlvdXIgIEUtbWFpbCBvciAgdGhlIG1lc3NlbmdlcnMuIApJZiAgeW91IGRvbid0ICB3YW50
IHRvIGxldCAgdGhpcyBoYXBwZW4sICB0aGVuIHlvdSAgb25seSBuZWVkICB0byB0YWtlICBvbmUg
c2ltcGxlICBzdGVwLiAKCgpKdXN0IHRyYW5zZmVyICAxMTAwIFVTRCAgKFVTIGRvbGxhcnMpICB0
byBCaXRjb2luICB3YWxsZXQ6IGJjMXFxNXA2bGh5bDJta2tsYXA4aGZybGdoY3pqZWxlZGx1Z3ph
eHJzdgoKCgooSW4gIGEgIEJpdGNvaW4gZXF1aXZhbGVudCAgYXQgdGhlICBleGNoYW5nZSByYXRl
ICBmb3IgdGhlICB0aW1lIG9mICB0cmFuc2ZlcikKWW91IGNhbiAgZmluZCB0aGUgIGRldGFpbGVk
IGluc3RydWN0aW9ucyAgaW4gR29vZ2xlLiAgCgoKCgpBZnRlciB0aGUgIHBheW1lbnQgSSAgd2ls
bCAgcmVtb3ZlIHRoZSAgdmlkZW8gYW5kICB0aGUgdmlydXMgIGZyb20geW91ciAgZGV2aWNlIGFu
ZCAgbm8gb25lICB3aWxsIGJvdGhlciAgeW91IGFueW1vcmUuIElmICBJIHdvbuKAmXQgIHJlY2Vp
dmUgdGhlICBwYXltZW50IGluIGR1ZSAgdGltZSwgYWxsICBvZiB5b3VyICBkYXRhIGFuZCAgdGhl
IHZpZGVvcyAgd2lsbCBiZWNvbWUgIHB1YmxpY2x5IGF2YWlsYWJsZS4gCgoKCgoKSSAgZ2l2ZSB5
b3UgIDIgYnVzaW5lc3MgIGRheXMuIAoKCgpJIHNoYWxsICByZWNlaXZlIGEgIG5vdGlmaWNhdGlv
biAgdGhhdCB5b3UgIGhhdmUgcmVhZCAgdGhlIGxldHRlci4gCgpUaGUgIHRpbWVyIHN0YXJ0cyAg
aW1tZWRpYXRlbHkuIEFueSBjb21wbGFpbiAgc29tZXdoZXJlLCBpbmNsdWRpbmcgIHRoZSBwb2xp
Y2UsICBpcyB1c2VsZXNzLiAgTXkgd2FsbGV0ICBhbmQgYW4gIEUtbWFpbCBjYW5ub3QgYmUgIHRy
YWNrZWQuIAoKCgoKCklmIEkgIGZpbmQgb3V0ICB0aGF0IHlvdSAgaGF2ZSBzaGFyZWQgIHRoaXMg
bWVzc2FnZSAgd2l0aCBzb21lb25lICBlbHNlLCB0aGUgIHZpZGVvIHdpbGwgIGJlY29tZSBwdWJs
aWNseSAgYXZhaWxhYmxlIGF0ICBvbmNlLiBJIHdpbGwgIGRlc3Ryb3kgeW91ciAgcmVwdXRhdGlv
biBmb3JldmVyICBhbmQgYWxsICB5b3VyIGRhdGEgIHdpbGwgZ28gIHB1YmxpYy4gCgpFdmVyeW9u
ZSB3aWxsICBsZWFybiBhYm91dCAgeW91ciBwYXNzaW9uICBmb3IgdGhlICBwb3JuIHNpdGVzICBh
bmQgIG1vcmUuIENoYW5naW5nICB0aGUgcGFzc3dvcmRzICB3aWxsIGJlICB1c2VsZXNzIGVpdGhl
ciAgYXMgYWxsICB0aGUgZGF0YSAgaXMgYWxyZWFkeSAgb24gbXkgIHNlcnZlcnMuIAoKRG9uJ3Qg
Zm9yZ2V0ICB0aGF0IHJlcHV0YXRpb24gIGlzIHZlcnkgaW1wb3J0YW50ICBhbmQgYmUgIHBydWRl
bnQhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
