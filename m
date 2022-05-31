Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F84C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 May 2022 12:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4249F41940;
	Tue, 31 May 2022 12:05:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ohzVdNFbYcVd; Tue, 31 May 2022 12:05:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 94CFD41939;
	Tue, 31 May 2022 12:05:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6A01BC0039;
	Tue, 31 May 2022 12:05:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0ED5BC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 May 2022 12:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D96D6831EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 May 2022 12:05:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=globalkingprojectmanagement.com
 header.b="LXk0Vsmw"; dkim=pass (1024-bit key)
 header.d=elasticemail.com header.b="VHeVljhm"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H561jSoYZZa2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 May 2022 12:05:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from s4.mxout.mta4.net (s4.mxout.mta4.net [162.254.227.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 828AA831BD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 May 2022 12:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=globalkingprojectmanagement.com; s=api;
 c=relaxed/simple; t=1653998712;
 h=from:date:subject:reply-to:to:list-unsubscribe:mime-version;
 bh=RLKSN4cJMe3bO3QnSM0FqQ4CI64rCeAobKtXFJzRRiQ=;
 b=LXk0VsmwlsCtXfzrLNYgteMyDahbFLse6xxTr1B+LzXIHOAZcnHv6jF2gQTU/cSqeFxwSA2M/Xf
 YAIYBobMhx2qTxQxsAtyF67HlkBeRRt3mowQfWouq7OkXbFrbzDjprc6m+PXcR9DI5y/57i3CEIwC
 UlT77hlloWmkfj5zyYY=
DKIM-Signature: v=1; a=rsa-sha256; d=elasticemail.com; s=api;
 c=relaxed/simple; t=1653998712;
 h=from:date:subject:reply-to:to:list-unsubscribe;
 bh=RLKSN4cJMe3bO3QnSM0FqQ4CI64rCeAobKtXFJzRRiQ=;
 b=VHeVljhmzfv4UXj5JCdoGcjCC9T1YqPEV39tZ69UvUKUUAOWQ2YskyC97XA6/a2epnU07QGyYfh
 9g4XhG8hAGSIn3k6GC2ohOiYq5uZSzK86vfvEgWLkGEy9WKwhBlphfGj2OxZfmcmb6fMcJK3kzp0G
 9Q6x6Nkfz/H7RDEIW6o=
From: Global King Project Management <outreach@globalkingprojectmanagement.com>
Date: Tue, 31 May 2022 12:05:12 +0000
Subject: RE Project Monitoring and Evaluation With Data Management And
 Analysis Course July 2022 Mombasa,Kenya
Message-Id: <4ugz8s1zncug.1i27d2zKxXlzEzVAQC7TRA2@tracking.globalkingprojectmanagement.com>
To: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
X-Msg-EID: 1i27d2zKxXlzEzVAQC7TRA2
MIME-Version: 1.0
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
Reply-To: outreach@globalkingprojectmanagement.com
Content-Type: multipart/mixed; boundary="===============6453759880126057434=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============6453759880126057434==
Content-Type: multipart/alternative;
	boundary="=-eZCfVWuHqSGePeyGUsU1TDP38zVBgsoX7XWKzQ=="

--=-eZCfVWuHqSGePeyGUsU1TDP38zVBgsoX7XWKzQ==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

DQpJTlZJVEFUSU9OIA0KTEVUVEVSwqDCoMKgDQpEZWFywqAgU2lyL01hZGFtLCDCoMKgwqAN
ClNVQkpFQ1Q6IA0KSU5WSVRBVElPTiBUTyBBVFRFTkTCoMKgwqANCklOVklUQVRJT04gDQpO
TzogDQoyMjA1MzAxNTYNCldlIA0KYXJlIGhhcHB5IHRvIGludml0ZSB5b3UgdG8gcGFydGlj
aXBhdGUgaW4gYSAxMC1kYXkgdHJhaW5pbmcgDQo8aHR0cDovL3RyYWNraW5nLmdsb2JhbGtp
bmdwcm9qZWN0bWFuYWdlbWVudC5jb20vdHJhY2tpbmcvY2xpY2s/ZD1OeTBIUU9fREpteFFq
MDlLb0k1UUw0R0lmelBidGs1QmowMUdsWlFJS2todUNvX1JtTi1qY090M2JPU3M3bFVwUk45
TzcxcEpJLUNrelZVUGtzNDk4Nm5HWnl3U1dybXBOSVI5aU1OV0ZnS19IZVlzd1VCd0JOODR1
dkZBWUhBM3RXRTRGOGpmUWhJOTM3SXFQZnJGX29Gb181ZFVBQ01TY2pZaFIwdDNlaTVKMD4N
Cm9uIFByb2plY3QgTW9uaXRvcmluZyBhbmQgDQpFdmFsdWF0aW9uIFdpdGggRGF0YSBNYW5h
Z2VtZW50IEFuZCBBbmFseXNpcyBDb3Vyc2V0byANCmJlIGhlbGQgZnJvbSAxMS8wNy8yMDIy
dG8gMjIvMDcvMjAyMmluIA0KPGh0dHA6Ly90cmFja2luZy5nbG9iYWxraW5ncHJvamVjdG1h
bmFnZW1lbnQuY29tL3RyYWNraW5nL2NsaWNrP2Q9VDVoN0o1T2xMSGdSUDVPb3FtVTFIX0Vr
ZzdXbm9RLVBmZGZjNW5GWWhuR0p0WGxjQzVKcW9VYmJhcVB6V1BmUjZSX2YzcWFaa1NJWjU4
TEJFQkUyci1JUGZOMTctZlh3eVZGVTNYQ09PeHN5VEpaZk4wVndQWWxJSjhaa2x6bXZacnMx
UmQ0RFF3VExhM2VJSG9MSi1YZW9MQW5tWmpzcDJvSFR5QjZEUUZ1bjA+DQpHbG9iYWwgS2lu
ZyBQcm9qZWN0IE1hbmFnZW1lbnQuIA0KU2hhcmUgd2l0aCB1cyB0aGUgbnVtYmVyIG9mIHBh
cnRpY2lwYW50cyBmb3IgcmVnaXN0cmF0aW9uIHB1cnBvc2VzLsKgIA0KwqANCg0KPGh0dHA6
Ly90cmFja2luZy5nbG9iYWxraW5ncHJvamVjdG1hbmFnZW1lbnQuY29tL3RyYWNraW5nL2Ns
aWNrP2Q9RnZtM3UwNlJiVm43bThGY043RHVQc21SMTFVaXVrSGFRLTBRWXdPYXZkaDAxdjRC
OEdxOTlVeVNZY1JFVUZvdjYtQUg0MGRhUTAtTi1jYzVrYlppWkxGanJIWkRRWVVlb2g1aVJY
NHlRY0tGRFUtZ2hsMnljdzdqVmFwUV9iMjhEUWV1cnc3VDNqdzJ0b3NlOFdPdllGR19QcHZV
RkhyN2NGbUlGUE8yRXpjMUM5N25rX2dGb2ZiY0pubUJfYUwwaThNYVZoNFVsM0VFRjBnaUdq
ZFQzWFpBQkpCMV9rcXo0b2VtN2VGcVQ4MlQxbUpNbDBSZkpfdnZRSTF3Uy1XTV91cFhURloy
T1VpenhxQmtiSXFBNXNnMT4NCkRvd25sb2FkIA0Kb3VyIEFkbWlzc2lvbiBGb3JtIGFuZCBG
aWxsIGZvciBJbnZvaWNlIHByb2Nlc3NpbmfCoA0KwqANCk1pbmltdW0gDQpSZXF1aXJlbWVu
dHM6wqDCoMKgDQpBbGwgDQpmYWNpbGl0YXRpb24gYW5kIG1hdGVyaWFscyB3aWxsIGJlIG9m
ZmVyZWQgaW4gRW5nbGlzaC4gVGhlIHBhcnRpY2lwYW50cyBzaG91bGQgDQpiZSByZWFzb25h
Ymx5IHByb2ZpY2llbnQgaW4gRW5nbGlzaC7CoCANCsKgwqDCoA0KVHJhaW5pbmcgDQpWZW51
ZSBhbmQgQWNjb21tb2RhdGlvbjrCoMKgIA0KwqBUaGUgdHJhaW5pbmcgd2lsbCBiZSBoZWxk
IGF0wqANCjxodHRwOi8vdHJhY2tpbmcuZ2xvYmFsa2luZ3Byb2plY3RtYW5hZ2VtZW50LmNv
bS90cmFja2luZy9jbGljaz9kPVQ1aDdKNU9sTEhnUlA1T29xbVUxSF9Fa2c3V25vUS1QZmRm
YzVuRllobkdKdFhsY0M1SnFvVWJiYXFQeldQZlI2Ul9mM3FhWmtTSVo1OExCRUJFMnJfbXJX
dkROSURyWERtaHRQcUhacGVfOTBOVmV4VXBvZVV5eEVnN2FlaUNJQmxSNVM1TzY1TW9LSDV6
XzJRZ20yTVNJLU9nNE96dUZ0X21tc0J2UUt2dnQwPg0KR2xvYmFsIEtpbmcgUHJvamVjdCBN
YW5hZ2VtZW50IA0KaW4gTW9tYmFzYSwgS2VueWEuIA0KQWNjb21tb2RhdGlvbiB3aWxsIGJl
IGNhdGVyZWQgZm9yIGJ5IHRoZSBwYXJ0aWNpcGFudC7CoCDCoMKgwqANClBhcnRpY2lwYXRp
b24gDQpGZWVzOsKgIMKgwqDCoMKgDQrCoCBEaXNjb3VudCANClN0cnVjdHVyZQ0KUEFYDQpE
aXNjb3VudCBvbiB0cmFpbmluZyANCiAgZmVlDQoyLTQNCjEwJQ0KNS0xMQ0KMjAlDQoxMi0y
MQ0KMjUlDQoyMi0zMQ0KMzAlDQozMi00MQ0KMzUlDQo0Mi01MQ0KNDAlDQptb3JlIHRoYW4g
NTENCjUwJQ0KwqANClRyYWluaW5nIA0KRmVlOiANCiQyLDQwMC4wMCANCnBlciBwYXJ0aWNp
cGFudCBhbmQgYSBkaXNjb3VudCBmb3IgbW9yZSANCmFjY29tbW9kYXRpb246IA0KDQrCoCAk
NTAtIA0KJDE1MCBCQg0KwqBBaXJwb3J0IHRyYW5zZmVyczogDQoNCiQ3MC4wMA0KwqANCkVu
cXVpcmU6wqDCoMKgDQpGb3IgDQphbnkgZW5xdWlyaWVzIHJlZ2FyZGluZyB0aGlzIGNvdXJz
ZSBjb250YWN0IHVzIG9uIA0KdHJhaW5pbmdAZ2xvYmFsa2luZ3Byb2plY3RtYW5hZ2VtZW50
Lm9yZ8KgIA0KDQpQYXltZW50OsKgwqDCoA0KUGF5bWVudCANCnNob3VsZCBiZSB0cmFuc2Zl
cnJlZCB0byBHbG9iYWwgS2luZyBQcm9qZWN0IE1hbmFnZW1lbnQgTHRkIGFjY291bnQgdGhy
b3VnaCB0aGUgDQpiYW5rIGJlZm9yZSB0aGUgY291cnNlIGJlZ2lucy7CoMKgIA0KDQpJbXBv
cnRhbnTCoCBHS1BNIExpbmtzOsKgIMKgDQoNCjxodHRwOi8vdHJhY2tpbmcuZ2xvYmFsa2lu
Z3Byb2plY3RtYW5hZ2VtZW50LmNvbS90cmFja2luZy9jbGljaz9kPU55MEhRT19ESm14UWow
OUtvSTVRTDRHSWZ6UGJ0azVCajAxR2xaUUlLa2dxcXk3UUtBVkJrMExSd2YyMDExY1dOWFo4
V2U4OW5tY3ViYWZhTUtQdUsyRDFJRDV6WmhTam9fTGw4OHYyeEZpbnN4cExSOHVPWlJ6VnYt
OFhpN3ZXRWpDVi1WVjh4Q0swQXZrTzBkQ1JLcW95bTk3UWNyMmpPdDJ0M3VWNl9rc08wPg0K
QWxsIENvdXJzZXMNClByb2plY3QgDQpNYW5hZ2VtZW50IFRyYWluaW5ncw0KDQo8aHR0cDov
L3RyYWNraW5nLmdsb2JhbGtpbmdwcm9qZWN0bWFuYWdlbWVudC5jb20vdHJhY2tpbmcvY2xp
Y2s/ZD1OeTBIUU9fREpteFFqMDlLb0k1UUw0R0lmelBidGs1QmowMUdsWlFJS2tqeWNLOW4z
aTB0Z0FLQ0wzNEFYY0lWRnM4OXNMYmJzUmZTQW9pVEQySDJXbXljMGNBTjJqbEZOWi1lU2xy
Uk5iTTZWek4tMWZ1eG95RldjeEFmRTgyWDI0TFRqOFlLSTE1UmVhQWdxdlA2R19oX1dJbXE1
ZFRGNmhJcWhpYmliS1IyMD4NClJlc2VhcmNoIHRyYWluaW5nIENvdXJzZXMNCg0KPGh0dHA6
Ly90cmFja2luZy5nbG9iYWxraW5ncHJvamVjdG1hbmFnZW1lbnQuY29tL3RyYWNraW5nL2Ns
aWNrP2Q9TnkwSFFPX0RKbXhRajA5S29JNVFMNEdJZnpQYnRrNUJqMDFHbFpRSUtranljSzlu
M2kwdGdBS0NMMzRBWGNJVkxKTE5LV1JGWnluUDRESjh1SU5sVUprS3VJZDNTLWszdWN0MkhB
TS1YVnVhM1hzb2dBbXhzTW12dWwtOS1RMndCMGd5S3d3dkVrTF9ZX19yT2dpcm1lLTdMaFdO
aWo2bkFvUldyTG5Gd0U5cDA+DQpMZWFkZXJzaGlwIFRyYWluaW5nIENvdXJzZXMgwqANCg0K
PGh0dHA6Ly90cmFja2luZy5nbG9iYWxraW5ncHJvamVjdG1hbmFnZW1lbnQuY29tL3RyYWNr
aW5nL2NsaWNrP2Q9d28yYVgtX2g1MmVEdUV0MTk0eFlPNTJpWFI1MjZXQkhYTmNvay1lakRK
WGZzUXJPWnlYdTBfS0REUUlMa19yaHZBTUVCVlJERzExTS01ZjNHY2U1dmVMWWNvV3FVNFQw
WlNySVF2dlRXb1NuWVN3UFhLam1jU3VRTmttZ3hfTHU2b3FTT3N1WWVHcGNTaW9XenhEOV9O
MDZXOEJyU0tjakxNODRsSXE3MmtMVUN5NmFkYi0tdHRRbUtTMkhMOEs0ZHcyPg0KRG93bmxv
YWQgb3VyIENhbGVuZGFyDQpZb3VycyANClNpbmNlcmVseSzCoCDCoMKgwqANCsKgDQpWaXJn
aW5pYSANCldhbWFpdGhhIA0KUHJvamVjdCANCk1hbmFnZW1lbnQgRXhwZXJ0IGFuZCBQTVAg
Y2VydGlmaWVkDQoNCjxodHRwOi8vdHJhY2tpbmcuZ2xvYmFsa2luZ3Byb2plY3RtYW5hZ2Vt
ZW50LmNvbS90cmFja2luZy9jbGljaz9kPVQ1aDdKNU9sTEhnUlA1T29xbVUxSF9Fa2c3V25v
US1QZmRmYzVuRllobkdKdFhsY0M1SnFvVWJiYXFQeldQZlI2Ul9mM3FhWmtTSVo1OExCRUJF
MnJ5dGNOOURDOHczcEZ1S0k1RGdLbFNpOTRFTkg3eTA2SHZoVnRKTTBQX0ZxWVNPbEwzSVJN
MHoweTNDNmdaRHJpenVoS2VGNGNhQW9UTXUyT2JVcFh1N0MwPg0KR2xvYmFsIEtpbmcgUHJv
amVjdCBNYW5hZ2VtZW50IA0KVGVsZTogDQorMjU0MTE0ODMwODg5DQpFbWFpbCANCkFkZHJl
c3M6IHRyYWluaW5nQGdsb2JhbGtpbmdwcm9qZWN0bWFuYWdlbWVudC5vcmfCoCANClRyYW5z
bmF0aW9uYWwgDQpQbGF6YSAzcmQgRmxvb3IgTmFpcm9iaSwgS2VueWEgwqDCoMKgDQrCoA0K
PGh0dHA6Ly90cmFja2luZy5nbG9iYWxraW5ncHJvamVjdG1hbmFnZW1lbnQuY29tL3RyYWNr
aW5nL3Vuc3Vic2NyaWJlP2Q9bWN3SVdWLXNMcXZ5STBESWZRY3FJVkJrR08yOFFSbWpfRnhx
YTgyMzljeEtWRUtsczhtSVRpamg2SDlXUlBNYkpNZkRqQW83OEdqUktNbnkzZHJrLUZoLWFZ
OHdvSGZCbmlkNFFKb1FSRFQ3V1dsaURVb21VdGluRmhrUldkNHdFQTI+DQpVTlNVQlNDUklC
RQ==

--=-eZCfVWuHqSGePeyGUsU1TDP38zVBgsoX7XWKzQ==
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Dunicode" http-equiv=3DContent-Ty=
pe>
<META name=3DGENERATOR content=3D"MSHTML 6.00.6000.16546"></HEAD>
<BODY>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 14.05pt -0.25pt; LINE-HE=
IGHT: 105%"><B=20
style=3D"mso-bidi-font-weight: normal"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'>INVITATION=20
LETTER</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'>=20
</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: Calibri'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;&nbsp;</SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;</SPAN><?xml:namespace prefix =3D "o=
" ns =3D=20
"urn:schemas-microsoft-com:office:office" /><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 14.7pt 0.45pt; LINE-HEIGHT: normal"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: "Times New Roman"'>Dear<SPAN=20
style=3D"mso-spacerun: yes">&nbsp; </SPAN>Sir/Madam, </SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: Calibri'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;&nbsp;</SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: "Times New Roman"'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;</SPAN><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 14.05pt -0.25pt; LINE-HE=
IGHT: 105%"><B=20
style=3D"mso-bidi-font-weight: normal"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'>SUBJECT:=20
INVITATION TO ATTEND</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'>=20
</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: Calibri'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;&nbsp;</SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;</SPAN><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 14.7pt 0.45pt; LINE-HEIG=
HT: normal"><B=20
style=3D"mso-bidi-font-weight: normal"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: "Times New Roman"'>INVITATION=20
NO:</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: "Times New Roman"'>=20
220530156<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 1.75pt; LINE-HEIGHT: 105=
%"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'>We=20
are happy to invite you to participate in a <B=20
style=3D"mso-bidi-font-weight: normal">10-day</B> training </SPAN><A=20
href=3D"http://tracking.globalkingprojectmanagement.com/tracking/click=
?d=3DNy0HQO_DJmxQj09KoI5QL4GIfzPbtk5Bj01GlZQIKkhuCo_RmN-jcOt3bOSs7lUpR=
N9O71pJI-CkzVUPks4986nGZywSWrmpNIR9iMNWFgK_HeYswUBwBN84uvFAYHA3tWE4F8j=
fQhI937IqPfrF_oFo_5dUACMScjYhR0t3ei5J0"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'><FONT=20
color=3D#0000ff>on<B style=3D"mso-bidi-font-weight: normal"> Project M=
onitoring and=20
Evaluation With Data Management And Analysis Course</B></FONT></SPAN><=
/A><B=20
style=3D"mso-bidi-font-weight: normal"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'>=20
</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'>to=20
be held from <B><SPAN=20
style=3D"BACKGROUND: white; COLOR: #333333">11/07/2022</SPAN></B><SPAN=
=20
style=3D"BACKGROUND: white; COLOR: #333333"> </SPAN>to <B><SPAN=20
style=3D"BACKGROUND: white; COLOR: #333333">22/07/2022</SPAN></B><SPAN=
=20
style=3D"BACKGROUND: white; COLOR: #333333"> </SPAN>in </SPAN><A=20
href=3D"http://tracking.globalkingprojectmanagement.com/tracking/click=
?d=3DT5h7J5OlLHgRP5OoqmU1H_Ekg7WnoQ-Pfdfc5nFYhnGJtXlcC5JqoUbbaqPzWPfR6=
R_f3qaZkSIZ58LBEBE2r-IPfN17-fXwyVFU3XCOOxsyTJZfN0VwPYlIJ8ZklzmvZrs1Rd4=
DQwTLa3eIHoLJ-XeoLAnmZjsp2oHTyB6DQFun0"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'><FONT=20
color=3D#0000ff>Global King Project Management</FONT></SPAN></A><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'>.=20
Share with us the number of participants for registration purposes.<SP=
AN=20
style=3D"mso-spacerun: yes">&nbsp; </SPAN><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 1.75pt; LINE-HEIGHT: 105=
%"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'><o:p>&nbsp;</=
o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 1.75pt; LINE-HEIGHT: 105=
%"><A=20
href=3D"http://tracking.globalkingprojectmanagement.com/tracking/click=
?d=3DFvm3u06RbVn7m8FcN7DuPsmR11UiukHaQ-0QYwOavdh01v4B8Gq99UySYcREUFov6=
-AH40daQ0-N-cc5kbZiZLFjrHZDQYUeoh5iRX4yQcKFDU-ghl2ycw7jVapQ_b28DQeurw7=
T3jw2tose8WOvYFG_PpvUFHr7cFmIFPO2Ezc1C97nk_gFofbcJnmB_aL0i8MaVh4Ul3EEF=
0giGjdT3XZABJB1_kqz4oem7eFqT82T1mJMl0RfJ_vvQI1wS-WM_upXTFZ2OUizxqBkbIq=
A5sg1"><FONT=20
color=3D#0000ff><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'>Download=20
our Admission Form and Fill for Invoice processing</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: Calibri'>=20
</SPAN></FONT></A><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: Calibri'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;</SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></=
SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 1.75pt; LINE-HEIGHT: 105=
%"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;</SPAN><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 14.05pt -0.25pt; LINE-HE=
IGHT: 105%"><B=20
style=3D"mso-bidi-font-weight: normal"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'>Minimum=20
Requirements:</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'>=20
</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: Calibri'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;&nbsp;</SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;</SPAN><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 14.7pt 0.45pt; LINE-HEIGHT: normal"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: "Times New Roman"'>All=20
facilitation and materials will be offered in English. The participant=
s should=20
be reasonably proficient in English.<SPAN style=3D"mso-spacerun: yes">=
&nbsp;=20
</SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: Calibri'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;&nbsp;</SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: "Times New Roman"'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;</SPAN><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 14.05pt -0.25pt; LINE-HE=
IGHT: 105%"><B=20
style=3D"mso-bidi-font-weight: normal"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'>Training=20
Venue and Accommodation:</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'>&nbsp;</SPAN>=
<SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: Calibri'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp; </SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></=
SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 14.05pt -0.25pt; LINE-HEIGHT: 105%"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;</SPAN>The training will be held at&=
nbsp;<B>=20
</B></SPAN><A href=3D"http://tracking.globalkingprojectmanagement.com/=
tracking/click?d=3DT5h7J5OlLHgRP5OoqmU1H_Ekg7WnoQ-Pfdfc5nFYhnGJtXlcC5J=
qoUbbaqPzWPfR6R_f3qaZkSIZ58LBEBE2r_mrWvDNIDrXDmhtPqHZpe_90NVexUpoeUyxE=
g7aeiCIBlR5S5O65MoKH5z_2Qgm2MSI-Og4OzuFt_mmsBvQKvvt0"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'><FONT=20
color=3D#0000ff>Global King Project Management</FONT></SPAN></B></A><B=
><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'>=20
in Mombasa, Kenya</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'>.=20
Accommodation will be catered for by the participant.<SPAN=20
style=3D"mso-spacerun: yes">&nbsp; </SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: Calibri'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;&nbsp;</SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;</SPAN><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 350.85pt 0.1pt -0.25pt; LINE-HEIGHT: 205%"><B=20
style=3D"mso-bidi-font-weight: normal"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 205%; mso-fareast-font-family: "Times New Roman"'>Participation=
=20
Fees:</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 205%; mso-fareast-font-family: "Times New Roman"'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp; </SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 205%; mso-fareast-font-family: Calibri'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;&nbsp;&nbsp;</SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 205%; mso-fareast-font-family: "Times New Roman"'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;</SPAN><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 350.85pt 0.1pt -0.25pt; LINE-HEIGHT: 205%"><B><SP=
AN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 205%; mso-fareast-font-family: "Times New Roman"'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp; </SPAN>Discount=20
Structure<o:p></o:p></SPAN></B></P>
<TABLE class=3DMsoNormalTable=20
style=3D"WIDTH: 185pt; BORDER-COLLAPSE: collapse; mso-yfti-tbllook: 11=
84; mso-padding-alt: 0in 5.4pt 0in 5.4pt"=20
cellSpacing=3D0 cellPadding=3D0 width=3D247 border=3D0>
  <TBODY>
  <TR style=3D"HEIGHT: 15pt; mso-yfti-irow: 0; mso-yfti-firstrow: yes"=
>
    <TD=20
    style=3D"BORDER-TOP: windowtext 1pt solid; HEIGHT: 15pt; BORDER-RI=
GHT: windowtext 1pt solid; WIDTH: 66pt; BORDER-BOTTOM: windowtext 1pt =
solid; PADDING-BOTTOM: 0in; PADDING-TOP: 0in; PADDING-LEFT: 5.4pt; BOR=
DER-LEFT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BACKGROUND-COLOR=
: transparent; mso-border-alt: solid windowtext .5pt"=20
    vAlign=3Dbottom width=3D88 noWrap>
      <P class=3DMsoNormal style=3D"MARGIN: 0in; LINE-HEIGHT: normal">=
<B><SPAN=20
      style=3D'COLOR: black; mso-fareast-font-family: "Times New Roman=
"; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso=
-bidi-font-family: Calibri'><FONT=20
      face=3DCalibri>PAX<o:p></o:p></FONT></SPAN></B></P></TD>
    <TD=20
    style=3D"BORDER-TOP: windowtext 1pt solid; HEIGHT: 15pt; BORDER-RI=
GHT: windowtext 1pt solid; WIDTH: 119pt; BORDER-BOTTOM: windowtext 1pt=
 solid; PADDING-BOTTOM: 0in; PADDING-TOP: 0in; PADDING-LEFT: 5.4pt; BO=
RDER-LEFT: #f0f0f0; PADDING-RIGHT: 5.4pt; BACKGROUND-COLOR: transparen=
t; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: s=
olid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt"=20
    vAlign=3Dbottom width=3D159 noWrap>
      <P class=3DMsoNormal style=3D"MARGIN: 0in; LINE-HEIGHT: normal">=
<B><SPAN=20
      style=3D'COLOR: black; mso-fareast-font-family: "Times New Roman=
"; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso=
-bidi-font-family: Calibri'><FONT=20
      face=3DCalibri>Discount on training=20
  fee<o:p></o:p></FONT></SPAN></B></P></TD></TR>
  <TR style=3D"HEIGHT: 15pt; mso-yfti-irow: 1">
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; HEIGHT: 15pt; BORDER-RIGHT: windowte=
xt 1pt solid; WIDTH: 66pt; BORDER-BOTTOM: windowtext 1pt solid; PADDIN=
G-BOTTOM: 0in; PADDING-TOP: 0in; PADDING-LEFT: 5.4pt; BORDER-LEFT: win=
dowtext 1pt solid; PADDING-RIGHT: 5.4pt; BACKGROUND-COLOR: transparent=
; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: =
solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt"=20
    vAlign=3Dbottom width=3D88 noWrap>
      <P class=3DMsoNormal style=3D"MARGIN: 0in; LINE-HEIGHT: normal">=
<B><SPAN=20
      style=3D'COLOR: black; mso-fareast-font-family: "Times New Roman=
"; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso=
-bidi-font-family: Calibri'><FONT=20
      face=3DCalibri>2-4<o:p></o:p></FONT></SPAN></B></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; HEIGHT: 15pt; BORDER-RIGHT: windowte=
xt 1pt solid; WIDTH: 119pt; BORDER-BOTTOM: windowtext 1pt solid; PADDI=
NG-BOTTOM: 0in; PADDING-TOP: 0in; PADDING-LEFT: 5.4pt; BORDER-LEFT: #f=
0f0f0; PADDING-RIGHT: 5.4pt; BACKGROUND-COLOR: transparent; mso-border=
-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid window=
text .5pt"=20
    vAlign=3Dbottom width=3D159 noWrap>
      <P class=3DMsoNormal=20
      style=3D"TEXT-ALIGN: right; MARGIN: 0in; LINE-HEIGHT: normal; TE=
XT-INDENT: 11.05pt; mso-char-indent-count: 1.0"=20
      align=3Dright><B><SPAN=20
      style=3D'COLOR: black; mso-fareast-font-family: "Times New Roman=
"; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso=
-bidi-font-family: Calibri'><FONT=20
      face=3DCalibri>10%<o:p></o:p></FONT></SPAN></B></P></TD></TR>
  <TR style=3D"HEIGHT: 15pt; mso-yfti-irow: 2">
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; HEIGHT: 15pt; BORDER-RIGHT: windowte=
xt 1pt solid; WIDTH: 66pt; BORDER-BOTTOM: windowtext 1pt solid; PADDIN=
G-BOTTOM: 0in; PADDING-TOP: 0in; PADDING-LEFT: 5.4pt; BORDER-LEFT: win=
dowtext 1pt solid; PADDING-RIGHT: 5.4pt; BACKGROUND-COLOR: transparent=
; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: =
solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt"=20
    vAlign=3Dbottom width=3D88 noWrap>
      <P class=3DMsoNormal style=3D"MARGIN: 0in; LINE-HEIGHT: normal">=
<B><SPAN=20
      style=3D'COLOR: black; mso-fareast-font-family: "Times New Roman=
"; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso=
-bidi-font-family: Calibri'><FONT=20
      face=3DCalibri>5-11<o:p></o:p></FONT></SPAN></B></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; HEIGHT: 15pt; BORDER-RIGHT: windowte=
xt 1pt solid; WIDTH: 119pt; BORDER-BOTTOM: windowtext 1pt solid; PADDI=
NG-BOTTOM: 0in; PADDING-TOP: 0in; PADDING-LEFT: 5.4pt; BORDER-LEFT: #f=
0f0f0; PADDING-RIGHT: 5.4pt; BACKGROUND-COLOR: transparent; mso-border=
-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid window=
text .5pt"=20
    vAlign=3Dbottom width=3D159 noWrap>
      <P class=3DMsoNormal=20
      style=3D"TEXT-ALIGN: right; MARGIN: 0in; LINE-HEIGHT: normal; TE=
XT-INDENT: 11.05pt; mso-char-indent-count: 1.0"=20
      align=3Dright><B><SPAN=20
      style=3D'COLOR: black; mso-fareast-font-family: "Times New Roman=
"; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso=
-bidi-font-family: Calibri'><FONT=20
      face=3DCalibri>20%<o:p></o:p></FONT></SPAN></B></P></TD></TR>
  <TR style=3D"HEIGHT: 15pt; mso-yfti-irow: 3">
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; HEIGHT: 15pt; BORDER-RIGHT: windowte=
xt 1pt solid; WIDTH: 66pt; BORDER-BOTTOM: windowtext 1pt solid; PADDIN=
G-BOTTOM: 0in; PADDING-TOP: 0in; PADDING-LEFT: 5.4pt; BORDER-LEFT: win=
dowtext 1pt solid; PADDING-RIGHT: 5.4pt; BACKGROUND-COLOR: transparent=
; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: =
solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt"=20
    vAlign=3Dbottom width=3D88 noWrap>
      <P class=3DMsoNormal style=3D"MARGIN: 0in; LINE-HEIGHT: normal">=
<B><SPAN=20
      style=3D'COLOR: black; mso-fareast-font-family: "Times New Roman=
"; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso=
-bidi-font-family: Calibri'><FONT=20
      face=3DCalibri>12-21<o:p></o:p></FONT></SPAN></B></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; HEIGHT: 15pt; BORDER-RIGHT: windowte=
xt 1pt solid; WIDTH: 119pt; BORDER-BOTTOM: windowtext 1pt solid; PADDI=
NG-BOTTOM: 0in; PADDING-TOP: 0in; PADDING-LEFT: 5.4pt; BORDER-LEFT: #f=
0f0f0; PADDING-RIGHT: 5.4pt; BACKGROUND-COLOR: transparent; mso-border=
-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid window=
text .5pt"=20
    vAlign=3Dbottom width=3D159 noWrap>
      <P class=3DMsoNormal=20
      style=3D"TEXT-ALIGN: right; MARGIN: 0in; LINE-HEIGHT: normal; TE=
XT-INDENT: 11.05pt; mso-char-indent-count: 1.0"=20
      align=3Dright><B><SPAN=20
      style=3D'COLOR: black; mso-fareast-font-family: "Times New Roman=
"; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso=
-bidi-font-family: Calibri'><FONT=20
      face=3DCalibri>25%<o:p></o:p></FONT></SPAN></B></P></TD></TR>
  <TR style=3D"HEIGHT: 15pt; mso-yfti-irow: 4">
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; HEIGHT: 15pt; BORDER-RIGHT: windowte=
xt 1pt solid; WIDTH: 66pt; BORDER-BOTTOM: windowtext 1pt solid; PADDIN=
G-BOTTOM: 0in; PADDING-TOP: 0in; PADDING-LEFT: 5.4pt; BORDER-LEFT: win=
dowtext 1pt solid; PADDING-RIGHT: 5.4pt; BACKGROUND-COLOR: transparent=
; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: =
solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt"=20
    vAlign=3Dbottom width=3D88 noWrap>
      <P class=3DMsoNormal style=3D"MARGIN: 0in; LINE-HEIGHT: normal">=
<B><SPAN=20
      style=3D'COLOR: black; mso-fareast-font-family: "Times New Roman=
"; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso=
-bidi-font-family: Calibri'><FONT=20
      face=3DCalibri>22-31<o:p></o:p></FONT></SPAN></B></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; HEIGHT: 15pt; BORDER-RIGHT: windowte=
xt 1pt solid; WIDTH: 119pt; BORDER-BOTTOM: windowtext 1pt solid; PADDI=
NG-BOTTOM: 0in; PADDING-TOP: 0in; PADDING-LEFT: 5.4pt; BORDER-LEFT: #f=
0f0f0; PADDING-RIGHT: 5.4pt; BACKGROUND-COLOR: transparent; mso-border=
-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid window=
text .5pt"=20
    vAlign=3Dbottom width=3D159 noWrap>
      <P class=3DMsoNormal=20
      style=3D"TEXT-ALIGN: right; MARGIN: 0in; LINE-HEIGHT: normal; TE=
XT-INDENT: 11.05pt; mso-char-indent-count: 1.0"=20
      align=3Dright><B><SPAN=20
      style=3D'COLOR: black; mso-fareast-font-family: "Times New Roman=
"; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso=
-bidi-font-family: Calibri'><FONT=20
      face=3DCalibri>30%<o:p></o:p></FONT></SPAN></B></P></TD></TR>
  <TR style=3D"HEIGHT: 15pt; mso-yfti-irow: 5">
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; HEIGHT: 15pt; BORDER-RIGHT: windowte=
xt 1pt solid; WIDTH: 66pt; BORDER-BOTTOM: windowtext 1pt solid; PADDIN=
G-BOTTOM: 0in; PADDING-TOP: 0in; PADDING-LEFT: 5.4pt; BORDER-LEFT: win=
dowtext 1pt solid; PADDING-RIGHT: 5.4pt; BACKGROUND-COLOR: transparent=
; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: =
solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt"=20
    vAlign=3Dbottom width=3D88 noWrap>
      <P class=3DMsoNormal style=3D"MARGIN: 0in; LINE-HEIGHT: normal">=
<B><SPAN=20
      style=3D'COLOR: black; mso-fareast-font-family: "Times New Roman=
"; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso=
-bidi-font-family: Calibri'><FONT=20
      face=3DCalibri>32-41<o:p></o:p></FONT></SPAN></B></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; HEIGHT: 15pt; BORDER-RIGHT: windowte=
xt 1pt solid; WIDTH: 119pt; BORDER-BOTTOM: windowtext 1pt solid; PADDI=
NG-BOTTOM: 0in; PADDING-TOP: 0in; PADDING-LEFT: 5.4pt; BORDER-LEFT: #f=
0f0f0; PADDING-RIGHT: 5.4pt; BACKGROUND-COLOR: transparent; mso-border=
-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid window=
text .5pt"=20
    vAlign=3Dbottom width=3D159 noWrap>
      <P class=3DMsoNormal=20
      style=3D"TEXT-ALIGN: right; MARGIN: 0in; LINE-HEIGHT: normal; TE=
XT-INDENT: 11.05pt; mso-char-indent-count: 1.0"=20
      align=3Dright><B><SPAN=20
      style=3D'COLOR: black; mso-fareast-font-family: "Times New Roman=
"; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso=
-bidi-font-family: Calibri'><FONT=20
      face=3DCalibri>35%<o:p></o:p></FONT></SPAN></B></P></TD></TR>
  <TR style=3D"HEIGHT: 15pt; mso-yfti-irow: 6">
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; HEIGHT: 15pt; BORDER-RIGHT: windowte=
xt 1pt solid; WIDTH: 66pt; BORDER-BOTTOM: windowtext 1pt solid; PADDIN=
G-BOTTOM: 0in; PADDING-TOP: 0in; PADDING-LEFT: 5.4pt; BORDER-LEFT: win=
dowtext 1pt solid; PADDING-RIGHT: 5.4pt; BACKGROUND-COLOR: transparent=
; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: =
solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt"=20
    vAlign=3Dbottom width=3D88 noWrap>
      <P class=3DMsoNormal style=3D"MARGIN: 0in; LINE-HEIGHT: normal">=
<B><SPAN=20
      style=3D'COLOR: black; mso-fareast-font-family: "Times New Roman=
"; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso=
-bidi-font-family: Calibri'><FONT=20
      face=3DCalibri>42-51<o:p></o:p></FONT></SPAN></B></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; HEIGHT: 15pt; BORDER-RIGHT: windowte=
xt 1pt solid; WIDTH: 119pt; BORDER-BOTTOM: windowtext 1pt solid; PADDI=
NG-BOTTOM: 0in; PADDING-TOP: 0in; PADDING-LEFT: 5.4pt; BORDER-LEFT: #f=
0f0f0; PADDING-RIGHT: 5.4pt; BACKGROUND-COLOR: transparent; mso-border=
-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid window=
text .5pt"=20
    vAlign=3Dbottom width=3D159 noWrap>
      <P class=3DMsoNormal=20
      style=3D"TEXT-ALIGN: right; MARGIN: 0in; LINE-HEIGHT: normal; TE=
XT-INDENT: 11.05pt; mso-char-indent-count: 1.0"=20
      align=3Dright><B><SPAN=20
      style=3D'COLOR: black; mso-fareast-font-family: "Times New Roman=
"; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso=
-bidi-font-family: Calibri'><FONT=20
      face=3DCalibri>40%<o:p></o:p></FONT></SPAN></B></P></TD></TR>
  <TR style=3D"HEIGHT: 15pt; mso-yfti-irow: 7; mso-yfti-lastrow: yes">
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; HEIGHT: 15pt; BORDER-RIGHT: windowte=
xt 1pt solid; WIDTH: 66pt; BORDER-BOTTOM: windowtext 1pt solid; PADDIN=
G-BOTTOM: 0in; PADDING-TOP: 0in; PADDING-LEFT: 5.4pt; BORDER-LEFT: win=
dowtext 1pt solid; PADDING-RIGHT: 5.4pt; BACKGROUND-COLOR: transparent=
; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: =
solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt"=20
    vAlign=3Dbottom width=3D88 noWrap>
      <P class=3DMsoNormal style=3D"MARGIN: 0in; LINE-HEIGHT: normal">=
<B><SPAN=20
      style=3D'COLOR: black; mso-fareast-font-family: "Times New Roman=
"; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso=
-bidi-font-family: Calibri'><FONT=20
      face=3DCalibri>more than 51<o:p></o:p></FONT></SPAN></B></P></TD=
>
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; HEIGHT: 15pt; BORDER-RIGHT: windowte=
xt 1pt solid; WIDTH: 119pt; BORDER-BOTTOM: windowtext 1pt solid; PADDI=
NG-BOTTOM: 0in; PADDING-TOP: 0in; PADDING-LEFT: 5.4pt; BORDER-LEFT: #f=
0f0f0; PADDING-RIGHT: 5.4pt; BACKGROUND-COLOR: transparent; mso-border=
-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid window=
text .5pt"=20
    vAlign=3Dbottom width=3D159 noWrap>
      <P class=3DMsoNormal=20
      style=3D"TEXT-ALIGN: right; MARGIN: 0in; LINE-HEIGHT: normal; TE=
XT-INDENT: 11.05pt; mso-char-indent-count: 1.0"=20
      align=3Dright><B><SPAN=20
      style=3D'COLOR: black; mso-fareast-font-family: "Times New Roman=
"; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso=
-bidi-font-family: Calibri'><FONT=20
      face=3DCalibri>50%<o:p></o:p></FONT></SPAN></B></P></TD></TR></T=
BODY></TABLE>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 350.85pt 0.1pt -0.25pt; LINE-HEIGHT: 205%"><B><SP=
AN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 205%; mso-fareast-font-family: "Times New Roman"'><o:p>&nbsp;</=
o:p></SPAN></B></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 350.85pt 0.1pt -0.25pt; LINE-HEIGHT: 205%"><B><SP=
AN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 205%; mso-fareast-font-family: "Times New Roman"'>Training=20
Fee: <o:p></o:p></SPAN></B></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 99pt 0.1pt -0.25pt; LINE-HEIGHT: 205%"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 205%; mso-fareast-font-family: "Times New Roman"'>$2,400.00=20
per participant and a discount for more <o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 99pt 0.1pt -0.25pt; LINE-HEIGHT: 205%"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 205%; mso-fareast-font-family: "Times New Roman"'>accommodation=
:=20
<o:p></o:p></SPAN></B></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 350.85pt 0.1pt -0.25pt; LINE-HEIGHT: 205%"><B><SP=
AN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 205%; mso-fareast-font-family: "Times New Roman"'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp; </SPAN></SPAN></B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 205%; mso-fareast-font-family: "Times New Roman"'>$50-=20
$150 BB<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 350.85pt 0.1pt -0.25pt; LINE-HEIGHT: 205%"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 205%; mso-fareast-font-family: "Times New Roman"'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;</SPAN><B>Airport transfers:=20
<o:p></o:p></B></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 350.85pt 0.1pt -0.25pt; LINE-HEIGHT: 205%"><B><SP=
AN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 205%; mso-fareast-font-family: "Times New Roman"'>$70.00</SPAN>=
</B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 205%; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></=
SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 350.85pt 0.1pt -0.25pt; LINE-HEIGHT: 205%"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 205%; mso-fareast-font-family: "Times New Roman"'>&nbsp;<o:p></=
o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 14.05pt -0.25pt; LINE-HE=
IGHT: 105%"><B=20
style=3D"mso-bidi-font-weight: normal"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'>Enquire:</SPA=
N></B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'>=20
</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: Calibri'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;&nbsp;</SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;</SPAN><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 14.7pt 0.45pt; LINE-HEIGHT: normal"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: "Times New Roman"'>For=20
any enquiries regarding this course contact us on=20
training@globalkingprojectmanagement.org<SPAN style=3D"mso-spacerun: y=
es">&nbsp;=20
</SPAN><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 14.05pt -0.25pt; LINE-HE=
IGHT: 105%"><B=20
style=3D"mso-bidi-font-weight: normal"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'>Payment:</SPA=
N></B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'>=20
</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: Calibri'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;&nbsp;</SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 105%; mso-fareast-font-family: "Times New Roman"'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;</SPAN><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 14.7pt 0.45pt; LINE-HEIGHT: normal"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: "Times New Roman"'>Payment=20
should be transferred to Global King Project Management Ltd account th=
rough the=20
bank before the course begins.<SPAN style=3D"mso-spacerun: yes">&nbsp;=
&nbsp;=20
</SPAN><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 14.7pt 0.45pt; LINE-HEIGHT: normal"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: Calibri'>Important<SPAN=20
style=3D"mso-spacerun: yes">&nbsp; </SPAN>GKPM Links:</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: Calibri'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp; </SPAN><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;</SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 14.7pt 0.45pt; LINE-HEIG=
HT: normal"><A=20
href=3D"http://tracking.globalkingprojectmanagement.com/tracking/click=
?d=3DNy0HQO_DJmxQj09KoI5QL4GIfzPbtk5Bj01GlZQIKkgqqy7QKAVBk0LRwf2011cWN=
XZ8We89nmcubafaMKPuK2D1ID5zZhSjo_Ll88v2xFinsxpLR8uOZRzVv-8Xi7vWEjCV-VV=
8xCK0AvkO0dCRKqoym97Qcr2jOt2t3uV6_ksO0"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: Calibri'><FONT=20
color=3D#0000ff>All Courses</FONT></SPAN></A><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 14.7pt 0.45pt; LINE-HEIGHT: normal"><U><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 blue; mso-fareast-font-family: Calibri'>Project=20
Management Trainings<o:p></o:p></SPAN></U></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 14.7pt 0.45pt; LINE-HEIG=
HT: normal"><A=20
href=3D"http://tracking.globalkingprojectmanagement.com/tracking/click=
?d=3DNy0HQO_DJmxQj09KoI5QL4GIfzPbtk5Bj01GlZQIKkjycK9n3i0tgAKCL34AXcIVF=
s89sLbbsRfSAoiTD2H2Wmyc0cAN2jlFNZ-eSlrRNbM6VzN-1fuxoyFWcxAfE82X24LTj8Y=
KI15ReaAgqvP6G_h_WImq5dTF6hIqhibibKR20"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: Calibri'><FONT=20
color=3D#0000ff>Research training Courses</FONT></SPAN></A><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 14.7pt 0.45pt; LINE-HEIG=
HT: normal"><A=20
href=3D"http://tracking.globalkingprojectmanagement.com/tracking/click=
?d=3DNy0HQO_DJmxQj09KoI5QL4GIfzPbtk5Bj01GlZQIKkjycK9n3i0tgAKCL34AXcIVL=
JLNKWRFZynP4DJ8uINlUJkKuId3S-k3uct2HAM-XVua3XsogAmxsMmvul-9-Q2wB0gyKww=
vEkL_Y__rOgirme-7LhWNij6nAoRWrLnFwE9p0"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: Calibri'><FONT=20
color=3D#0000ff>Leadership Training Courses </FONT></SPAN></A><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: "Times New Roman"'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;</SPAN><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 14.7pt 0.45pt; LINE-HEIG=
HT: normal"><A=20
href=3D"http://tracking.globalkingprojectmanagement.com/tracking/click=
?d=3Dwo2aX-_h52eDuEt194xYO52iXR526WBHXNcok-ejDJXfsQrOZyXu0_KDDQILk_rhv=
AMEBVRDG11M-5f3Gce5veLYcoWqU4T0ZSrIQvvTWoSnYSwPXKjmcSuQNkmgx_Lu6oqSOsu=
YeGpcSioWzxD9_N06W8BrSKcjLM84lIq72kLUCy6adb--ttQmKS2HL8K4dw2"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: "Times New Roman"'><FONT=20
color=3D#0000ff>Download our Calendar</FONT></SPAN></A><U><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 blue; mso-fareast-font-family: Calibri'><o:p></o:p></SPAN></U></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 4.7pt 0.45pt; LINE-HEIGHT: normal"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: "Times New Roman"'>Yours=20
Sincerely,<SPAN style=3D"mso-spacerun: yes">&nbsp; </SPAN></SPAN><SPAN=
=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: Calibri'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;&nbsp;</SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: "Times New Roman"'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;</SPAN><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 4.7pt 0.45pt; LINE-HEIGHT: normal"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: "Times New Roman"'><o:p>&nbsp;</o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 4.7pt 0.45pt; LINE-HEIGHT: normal"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: "Times New Roman"'>Virginia=20
Wamaitha <o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 4.7pt 0.45pt; LINE-HEIGHT: normal"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: "Times New Roman"'>Project=20
Management Expert and PMP certified<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 4.7pt 0.45pt; LINE-HEIGH=
T: normal"><A=20
href=3D"http://tracking.globalkingprojectmanagement.com/tracking/click=
?d=3DT5h7J5OlLHgRP5OoqmU1H_Ekg7WnoQ-Pfdfc5nFYhnGJtXlcC5JqoUbbaqPzWPfR6=
R_f3qaZkSIZ58LBEBE2rytcN9DC8w3pFuKI5DgKlSi94ENH7y06HvhVtJM0P_FqYSOlL3I=
RM0z0y3C6gZDrizuhKeF4caAoTMu2ObUpXu7C0"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: "Times New Roman"'><FONT=20
color=3D#0000ff>Global King Project Management </FONT></SPAN></A><U><S=
PAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 blue; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></SPAN><=
/U></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 14.7pt 0.45pt; LINE-HEIGHT: normal"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: "Times New Roman"'>Tele:=20
+254114830889<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 14.7pt 0.45pt; LINE-HEIGHT: normal"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: "Times New Roman"'>Email=20
Address: training@globalkingprojectmanagement.org<SPAN=20
style=3D"mso-spacerun: yes">&nbsp; </SPAN><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 14.7pt 0.45pt; LINE-HEIGHT: normal"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: "Times New Roman"'>Transnational=20
Plaza 3<SUP>rd</SUP> Floor Nairobi, Kenya </SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: Calibri'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;&nbsp;</SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-fa=
reast-font-family: "Times New Roman"'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;</SPAN><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 8pt"><o:p><FONT=20
face=3DCalibri>&nbsp;</FONT></o:p></P></BODY></HTML>

<img src=3D"http://tracking.globalkingprojectmanagement.com/tracking/o=
pen?msgid=3D1i27d2zKxXlzEzVAQC7TRA2&c=3D1531607725199570540" style=3D"=
width:1px;height:1px" alt=3D"" /><div style=3D"text-align:center; back=
ground-color:#fff;padding-top:10px;padding-bottom:10px;font-size:8pt;f=
ont-family:sans-serif;"><a href=3D"http://tracking.globalkingprojectma=
nagement.com/tracking/unsubscribe?d=3DmcwIWV-sLqvyI0DIfQcqIVBkGO28QRmj=
_Fxqa8239cxKVEKls8mITijh6H9WRPMbJMfDjAo78GjRKMny3drk-Fh-aY8woHfBnid4QJ=
oQRDT7WWliDUomUtinFhkRWd4wEA2" style=3D"text-align:center;text-decorat=
ion:none;color:#666;">UNSUBSCRIBE</a></div>
--=-eZCfVWuHqSGePeyGUsU1TDP38zVBgsoX7XWKzQ==--


--===============6453759880126057434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============6453759880126057434==--


