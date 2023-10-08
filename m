Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB83E95A82
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Oct 2023 08:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1848F60DC6;
	Sun,  8 Oct 2023 08:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1848F60DC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uDlEN0mEjGGl; Sun,  8 Oct 2023 08:18:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E54E060D8E;
	Sun,  8 Oct 2023 08:18:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E54E060D8E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BB594C0039;
	Sun,  8 Oct 2023 08:18:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49320C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Oct 2023 08:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22F86410A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Oct 2023 08:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22F86410A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lsXh2WWVC3YP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Oct 2023 08:18:52 +0000 (UTC)
Received: from 7.mo575.mail-out.ovh.net (7.mo575.mail-out.ovh.net
 [46.105.63.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D59140347
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Oct 2023 08:18:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D59140347
Received: from director4.ghost.mail-out.ovh.net (unknown [10.109.143.220])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 10A1B27E21
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Oct 2023 08:00:01 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-9mdf6 (unknown [10.110.171.163])
 by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5E1A01FE55;
 Sun,  8 Oct 2023 08:00:00 +0000 (UTC)
Received: from foxhound.fi ([37.59.142.106])
 by ghost-submission-6684bf9d7b-9mdf6 with ESMTPSA
 id SGIwEoBhImXIvwAA5rXBkA
 (envelope-from <jose.pekkarinen@foxhound.fi>); Sun, 08 Oct 2023 08:00:00 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006c7d3698b-c1da-41f1-860f-13c89ef29aab,
 F6EE83B07292679BC443460DC7C66060252C3E74)
 smtp.auth=jose.pekkarinen@foxhound.fi
X-OVh-ClientIp: 83.100.45.21
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: dmitry.torokhov@gmail.com, rydberg@bitmath.org, skhan@linuxfoundation.org
Subject: [PATCH] Input: synaptics: enable InterTouch for ThinkPad L14 G1
Date: Sun,  8 Oct 2023 11:01:28 +0300
Message-ID: <20231008080129.17931-1-jose.pekkarinen@foxhound.fi>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 7025896895597160102
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrhedtgdduvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpeeftdelueetieetvdettdetueeivedujeefffdvteefkeelhefhleelfeetteejjeenucfkphepuddvjedrtddrtddruddpkeefrddutddtrdeghedrvddupdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlqdhmvghnthgvvghssehlihhsthhsrdhlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdfovfetjfhoshhtpehmohehjeehpdhmohguvgepshhmthhpohhuth
Cc: amandhoot12@gmail.com, linux-kernel@vger.kernel.org, rrangel@chromium.org,
 linux-input@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T2JzZXJ2ZWQgb24gZG1lc2cgb2YgbXkgbGFwdG9wIEkgc2VlIHRoZSBmb2xsb3dpbmcKb3V0cHV0
OgoKWyAgIDE5Ljg5ODcwMF0gcHNtb3VzZSBzZXJpbzE6IHN5bmFwdGljczogcXVlcmllZCBtYXgg
Y29vcmRpbmF0ZXM6IHggWy4uNTY3OF0sIHkgWy4uNDY5NF0KWyAgIDE5LjkzNjA1N10gcHNtb3Vz
ZSBzZXJpbzE6IHN5bmFwdGljczogcXVlcmllZCBtaW4gY29vcmRpbmF0ZXM6IHggWzEyNjYuLl0s
IHkgWzExNjIuLl0KWyAgIDE5LjkzNjA3Nl0gcHNtb3VzZSBzZXJpbzE6IHN5bmFwdGljczogWW91
ciB0b3VjaHBhZCAoUE5QOiBMRU4wNDExIFBOUDBmMTMpIHNheXMgaXQgY2FuIHN1cHBvcnQgYSBk
aWZmZXJlbnQgYnVzLiBJZiBpMmMtaGlkIGFuZCBoaWQtcm1pIGFyZSBub3QgdXNlZCwgeW91IG1p
Z2h0IHdhbnQgdG8gdHJ5IHNldHRpbmcgcHNtb3VzZS5zeW5hcHRpY3NfaW50ZXJ0b3VjaCB0byAx
IGFuZCByZXBvcnQgdGhpcyB0byBsaW51eC1pbnB1dEB2Z2VyLmtlcm5lbC5vcmcuClsgICAyMC4w
MDg5MDFdIHBzbW91c2Ugc2VyaW8xOiBzeW5hcHRpY3M6IFRvdWNocGFkIG1vZGVsOiAxLCBmdzog
MTAuMzIsIGlkOiAweDFlMmExLCBjYXBzOiAweGYwMTRhMy8weDk0MDMwMC8weDEyZTgwMC8weDUw
MDAwMCwgYm9hcmQgaWQ6IDM0NzEsIGZ3IGlkOiAyOTA5NjQwClsgICAyMC4wMDg5MjVdIHBzbW91
c2Ugc2VyaW8xOiBzeW5hcHRpY3M6IHNlcmlvOiBTeW5hcHRpY3MgcGFzcy10aHJvdWdoIHBvcnQg
YXQgaXNhMDA2MC9zZXJpbzEvaW5wdXQwClsgICAyMC4wNTMzNDRdIGlucHV0OiBTeW5QUy8yIFN5
bmFwdGljcyBUb3VjaFBhZCBhcyAvZGV2aWNlcy9wbGF0Zm9ybS9pODA0Mi9zZXJpbzEvaW5wdXQv
aW5wdXQ3ClsgICAyMC4zOTc2MDhdIG1vdXNlZGV2OiBQUy8yIG1vdXNlIGRldmljZSBjb21tb24g
Zm9yIGFsbCBtaWNlCgpUaGlzIHBhdGNoIHdpbGwgYWRkIGl0cyBwbnAgaWQgdG8gdGhlIHNtYnVz
IGxpc3QgdG8KcHJvZHVjZSB0aGUgc2V0dXAgb2YgaW50ZXJ0b3VjaCBmb3IgdGhlIGRldmljZS4g
QWZ0ZXIKYXBwbHlpbmcsIHRoZSBvdXB1dCB3aWxsIGxvb2sgbGlrZToKClsgICAxOS4xNjg2NjRd
IHBzbW91c2Ugc2VyaW8xOiBzeW5hcHRpY3M6IHF1ZXJpZWQgbWF4IGNvb3JkaW5hdGVzOiB4IFsu
LjU2NzhdLCB5IFsuLjQ2OTRdClsgICAxOS4yMDYzMTFdIHBzbW91c2Ugc2VyaW8xOiBzeW5hcHRp
Y3M6IHF1ZXJpZWQgbWluIGNvb3JkaW5hdGVzOiB4IFsxMjY2Li5dLCB5IFsxMTYyLi5dClsgICAx
OS4yMDYzMjVdIHBzbW91c2Ugc2VyaW8xOiBzeW5hcHRpY3M6IFRyeWluZyB0byBzZXQgdXAgU01C
dXMgYWNjZXNzClsgICAxOS4yMDk1NDVdIHBzbW91c2Ugc2VyaW8xOiBzeW5hcHRpY3M6IFNNYnVz
IGNvbXBhbmlvbiBpcyBub3QgcmVhZHkgeWV0ClsgICAxOS4yODM4NDVdIHBzbW91c2Ugc2VyaW8x
OiBzeW5hcHRpY3M6IFRvdWNocGFkIG1vZGVsOiAxLCBmdzogMTAuMzIsIGlkOiAweDFlMmExLCBj
YXBzOiAweGYwMTRhMy8weDk0MDMwMC8weDEyZTgwMC8weDUwMDAwMCwgYm9hcmQgaWQ6IDM0NzEs
IGZ3IGlkOiAyOTA5NjQwClsgICAxOS4yODM4NjNdIHBzbW91c2Ugc2VyaW8xOiBzeW5hcHRpY3M6
IHNlcmlvOiBTeW5hcHRpY3MgcGFzcy10aHJvdWdoIHBvcnQgYXQgaXNhMDA2MC9zZXJpbzEvaW5w
dXQwClsgICAxOS4zMjg5NTldIGlucHV0OiBTeW5QUy8yIFN5bmFwdGljcyBUb3VjaFBhZCBhcyAv
ZGV2aWNlcy9wbGF0Zm9ybS9pODA0Mi9zZXJpbzEvaW5wdXQvaW5wdXQ4ClsgICAxOS43MDYxNjRd
IG1vdXNlZGV2OiBQUy8yIG1vdXNlIGRldmljZSBjb21tb24gZm9yIGFsbCBtaWNlCgpTaWduZWQt
b2ZmLWJ5OiBKb3PDqSBQZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5AZm94aG91bmQuZmk+Ci0t
LQogZHJpdmVycy9pbnB1dC9tb3VzZS9zeW5hcHRpY3MuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pbnB1dC9tb3VzZS9zeW5hcHRp
Y3MuYyBiL2RyaXZlcnMvaW5wdXQvbW91c2Uvc3luYXB0aWNzLmMKaW5kZXggYWRhMjk5ZWM1YmJh
Li4zNzZhMDQxYzgwYjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaW5wdXQvbW91c2Uvc3luYXB0aWNz
LmMKKysrIGIvZHJpdmVycy9pbnB1dC9tb3VzZS9zeW5hcHRpY3MuYwpAQCAtMTgzLDYgKzE4Myw3
IEBAIHN0YXRpYyBjb25zdCBjaGFyICogY29uc3Qgc21idXNfcG5wX2lkc1tdID0gewogCSJMRU4w
MDliIiwgLyogVDU4MCAqLwogCSJMRU4wNDAyIiwgLyogWDEgRXh0cmVtZSBHZW4gMiAvIFAxIEdl
biAyICovCiAJIkxFTjA0MGYiLCAvKiBQMSBHZW4gMyAqLworCSJMRU4wNDExIiwgLyogTDE0IEdl
biAxICovCiAJIkxFTjIwMGYiLCAvKiBUNDUwcyAqLwogCSJMRU4yMDQ0IiwgLyogTDQ3MCAgKi8K
IAkiTEVOMjA1NCIsIC8qIEU0ODAgKi8KLS0gCjIuNDEuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBs
aXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVs
LW1lbnRlZXMK
