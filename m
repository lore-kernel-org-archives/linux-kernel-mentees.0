Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6C5C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Feb 2022 10:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6530C4155E;
	Wed,  2 Feb 2022 10:43:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pcTdWwAD9qVR; Wed,  2 Feb 2022 10:43:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3549E40899;
	Wed,  2 Feb 2022 10:43:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0D3FBC001A;
	Wed,  2 Feb 2022 10:43:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3EE04C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Feb 2022 10:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3378881368
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Feb 2022 10:43:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=fdc-k.africa header.b="HPVg0uaE";
 dkim=pass (1024-bit key) header.d=elasticemail.com header.b="Ktf30mtp"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q57OXCvVoVWY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Feb 2022 10:43:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from f105.mxout.mta4.net (f105.mxout.mta4.net [96.45.68.105])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07CEC81322
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Feb 2022 10:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=fdc-k.africa; s=api; c=relaxed/simple;
 t=1643798611; h=from:date:subject:reply-to:to:list-unsubscribe:mime-version;
 bh=oL2BR4Vf+ybXHgjuUm0cGoyPtcLYYILq6ibGYhOxsL0=;
 b=HPVg0uaEFeFA2mhMpZRWT8IqwwJfGNGEeInOZuUV25Q4rdhF5X4DKjhTey8AjtBZqG6Q9WwgdQh
 z/oE779ZN6G11HiZ5VokTLjzsRZIj6AqQOz5ekIWtmaEk3AfoCEbt6LDeYNvvlO7WoMFhPWsLzBaC
 /cwvDeH1nnONs/H9+LI=
DKIM-Signature: v=1; a=rsa-sha256; d=elasticemail.com; s=api;
 c=relaxed/simple; t=1643798611;
 h=from:date:subject:reply-to:to:list-unsubscribe;
 bh=oL2BR4Vf+ybXHgjuUm0cGoyPtcLYYILq6ibGYhOxsL0=;
 b=Ktf30mtpkWXmU+xbutxAcr3YRBHTh+8iICMFgHgqCL1IIdKIBQN6uu9WLOcmZGY7+R+NIWoP5A3
 f8furbN/Rq+52ttlZgIoVaSAedvHvBRO9jTza6XbgFhOo/YYO6lpkLZkzEzM9IdE7DffxfwT4X82w
 auD8lQUDaI6PQPulKGE=
From: Foscore Development Center Africa <workshops@fdc-k.africa>
Date: Wed, 02 Feb 2022 10:43:31 +0000
Subject: RE: Remote Sensing and GIS in Multi Hazard Early Warning Systems
 March workshop 2022
Message-Id: <4ufz35mj34kx.4kf7cGpdTydUMlmmjaNaaQ2@tracking.fdc-k.africa>
To: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
X-Msg-EID: 4kf7cGpdTydUMlmmjaNaaQ2
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
Reply-To: workshops@fdc-k.africa
Content-Type: multipart/mixed; boundary="===============1466610905052664556=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============1466610905052664556==
Content-Type: multipart/alternative;
	boundary="=-eZCfUGnTqSbrN8Oqc80aRCXM3w5j+/8k/XWKzQ=="

--=-eZCfUGnTqSbrN8Oqc80aRCXM3w5j+/8k/XWKzQ==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

DQoNCjxodHRwOi8vdHJhY2tpbmcuZmRjLWsuYWZyaWNhL3RyYWNraW5nL2NsaWNrP2Q9T0g0
Qi1uOTM0TE5pY2lkdWxfaDhXQm1lLUtCcFNwakl6TmVEamVlMkhBVkdWSktYakVodnIxaTNu
TkpRcTUxOVh0eHQzejItYzBBX0FNTHctUnFRMnoxT1NoRExpUV9KbEVQbHkxaVg0QTc5R0R5
WWRuRFE3S2YzdURvT3I0QjBzRnF1TDIxMFdmMExvcU9PU191U3BUeDZKR1pNNVBmTHUxM1ly
NjI1QTFnX2NtUF9Jc1hpQlg4OEtKekV3UHFyZjhpcXExcVRzenRyNmo2VVpHS2UxWnVlQU5Z
dkFNbms4UjJHWS1DY2NLNDBqTjBzOTE3dHA5Qjl4RHZkTmZ4NWNBMj4NClJlbW90ZSANClNl
bnNpbmcgYW5kIEdJUyBpbiBNdWx0aSBIYXphcmQgRWFybHkgV2FybmluZyBTeXN0ZW1zIE1h
cmNoIHdvcmtzaG9wIA0KMjAyMg0KwqANCg0KPGh0dHA6Ly90cmFja2luZy5mZGMtay5hZnJp
Y2EvdHJhY2tpbmcvY2xpY2s/ZD1PSDRCLW45MzRMTmljaWR1bF9oOFdCbWUtS0JwU3BqSXpO
ZURqZWUySEFWR1ZKS1hqRWh2cjFpM25OSlFxNTE5WHR4dDN6Mi1jMEFfQU1Mdy1ScVEyejFP
U2hETGlRX0psRVBseTFpWDRBNzlHRHlZZG5EUTdLZjN1RG9PcjRCMHNGcXVMMjEwV2YwTG9x
T09TX3VTcFR4NkpHWk01UGZMdTEzWXI2MjVBMWdDdHlROTA0M0tBc2J1VHVWWWs1VlFnczU1
R1pNMTVNWlVRelBfT0g0cUw4ZElGTGJEVUlHV0U3RXBvSTg3WFBzbFlPRHVQU3d1VXRzcEtW
VWVpS091bmcyPg0KUmVnaXN0ZXIgDQphcyBpbmRpdmlkdWFsLCBHcm91cCBvciBPbmxpbmUN
CsKgDQoNCjxodHRwOi8vdHJhY2tpbmcuZmRjLWsuYWZyaWNhL3RyYWNraW5nL2NsaWNrP2Q9
c3JlQndvRHpZZGdqM2JPYUJDUkJzVWpmQmw3SU5zOG02Rzc4ODBGTzkzaVBtNlljaW9NVmlo
Ykd0NWc5d3ZwN0Y5cjhmTzVVTU1Hdm1Ga2k5UGFfSkNQMTVGMjcwbjJ2eDl3dVZuMTVJbHBs
ZzJYbzluU3NlMzlVd05WMUZUN2pnSXVkcXpTaXBCNEhlbTRSVGc1LVBNSC1zT0laWUVQcWs4
ajRJSDVRMEtzYTA+DQpEb3dubG9hZCBvdXIgDQpjYWxlbmRlcg0KwqANCg0KPGh0dHA6Ly90
cmFja2luZy5mZGMtay5hZnJpY2EvdHJhY2tpbmcvY2xpY2s/ZD1wVnQyNG5CQ0lCYVFob1Vr
X0pvSFhGdnJSZ0ZSNU1QR0xpTWh5WHhndmd5SUR5WFNiaEkxS2JMX2FlcDdTeEtkcFNmbm1Z
cXllUXRIN1d6N0w4MXpOTWQ5eWd0bHV0eHJLR2lKN21jdE5XeTE5MHdiSVpJSUg1M0VkLTlV
Z0NBcFdiZEhRd1c1Vk9IcUNoYUFtQXBQMDdvMT4NCkRvd25sb2FkIG91ciANCmJyb2NodXJl
DQrCoA0KRGlzY291bnQ6IA0KMjAlIGZvciA1IGFuZCBtb3JlIHBhcnRpY2lwYW50cw0KwqAN
Cg0KPGh0dHA6Ly90cmFja2luZy5mZGMtay5hZnJpY2EvdHJhY2tpbmcvY2xpY2s/ZD1Fangx
MGttWFAyOTlNUF91ZTBxc1ZWZ3NtZUN5Q0wyYWE5aGloc1luMXF4dVFzeHVqWFRwaWRGYlJk
T2h6OG5PZXJDa1VVMWlzbk1fb3A0dVUzNmVIRmJoREl0T25FQXNVNmRrNjN5QXg4Nkc2azA1
NldfMV93TlNScFJhSGd5aXpSMlpuaDZadVVvSTRaZmRxN3hUSnFzMT4NCk91ciAyMDIywqAg
b25zaXRlIA0KUHJvZ3JhbW1lcw0KwqANCg0KPGh0dHA6Ly90cmFja2luZy5mZGMtay5hZnJp
Y2EvdHJhY2tpbmcvY2xpY2s/ZD01UGtaUHA0OHQtOEh6NXNWYXRCRnBuNWEzZXBtWGhNXzNw
bmNTXzZBbWx5NG04RHBVTGl6YUk1WDdvREJVb0ZVcFdLazdNU3h6VVM0ZXRkWFdROUZDMFMt
d2FIUFUwS2dwQVRZZTNSRGE3T0R1dEwxZHJTNmNsTUZZWmhKa29ZMW1IOElRa3lta2dnNXpz
LUxMM0h3QXc4MT4NCk91ciAyMDIywqAgb25saW5lIA0KUHJvZ3JhbW1lcw0KwqANCkNlbnRl
cnM6TmFpcm9iaSxrZW55YXxNb21iYXNhLGtlbnlhfFJ3YW5kYSxraWdhbGl8RHViYWkNCsKg
DQpGb3IgDQphbnkgaW5xdWlyeSB0bzrCoHRyYWluaW5nQGZkYy1rLm9yZ8Kgb3IgKzI1NDcx
MjI2MDAzMSBvciANCjxodHRwOi8vdHJhY2tpbmcuZmRjLWsuYWZyaWNhL3RyYWNraW5nL2Ns
aWNrP2Q9RWp4MTBrbVhQMjk5TVBfdWUwcXNWVFRIRjVlZUpzQ01TOGF6SDJfbVRISVJSQlVR
NUhDVHJiM0NVcGp6WXJvakN1ZjFuRDNwckJtQU1ZM1B0YlJKQ0llcjNqTndYUk03TEVGTmNR
emRHWExMYlg0bW9ZSVBUNFhCRXJnMEQ2S2FfekNOVWdCVHFHOU85YTJhWC1EMThSODE+DQpD
b250YWN0IHVzDQrCoA0KwqBXZWJzaXRlOg0KPGh0dHA6Ly90cmFja2luZy5mZGMtay5hZnJp
Y2EvdHJhY2tpbmcvY2xpY2s/ZD1VdWhrX3ZyNGpzMThIbFBUS1NFakpZVFp5aHNES204d3h5
My03MWdORFdCZXdLRkE3cEVsNjlUV1BiZGQ4eF9mdnJoWEEtQTRyT2xUZ1BWWVpOSkNGQWRl
S0NqWHFvb2RrZXdJZDZXMFhtX1d1UEo1R3doSjZnYU5YS0ZCSGluTTBRMj4NCnd3dy5mZGMt
ay5vcmcNCsKgDQoNCjxodHRwOi8vdHJhY2tpbmcuZmRjLWsuYWZyaWNhL3RyYWNraW5nL2Ns
aWNrP2Q9SXVEYjVmVDRmYXBHRXBLRGViS1o1dEFVYk15aVFaS243SDVRX1VJSl9DRDJHOUV4
eWpkY3ZHbzIwTkNlNVNhSlBuRlE0SWdSWlVCbllLT0ltOTlpQ3l1dzF4dGstYW9lZWhoNVd2
VWZCSTBtM2lIU1hLbFZfaWxzcnVvUkdYZHJTSWVoTWY4OTN5akVKTnBBVUVQTXdtRTE+DQpD
b25zdWx0YWNpZXMNCsKgDQrCoA0KSW50cm9kdWN0aW9uDQpEZXZlbG9wIA0KdGhlIGNhcGFj
aXR5IG9mIHByb2Zlc3Npb25hbHMgdG8gZGVzaWduLCBtYW5hZ2UsIGV2YWx1YXRlIGFuZCB1
bmRlcnRha2UgDQppbXByb3ZlbWVudHMgaW4gcGVvcGxlLWNlbnRlcmVkIGVhcmx5IHdhcm5p
bmcgc3lzdGVtcyBmb3IgaHlkcm8tbWV0ZW9yb2xvZ2ljYWwgDQomIGdlb2xvZ2ljYWwgaGF6
YXJkcyBhbmQgZXh0cmVtZSBldmVudHMgYXNzb2NpYXRlZCB3aXRoIGNsaW1hdGUgY2hhbmdl
IGFuZCANCnZhcmlhYmlsaXR5LiBJdCBidWlsZHMgdXBvbiBleHBlcmllbmNlIGluIGJ1aWxk
aW5nIGNhcGFjaXRpZXMgb24gdXNlIG9mIEdJUywgDQpSZW1vdGUgU2Vuc2luZyBhbmQgc3Bh
Y2UgYmFzZWQgdGVjaG5vbG9naWVzIGluIGRpc2FzdGVyIHJpc2sgbWFuYWdlbWVudCBmb3Ig
DQpkaXNhc3RlciBtYW5hZ2VtZW50IGluc3RpdHV0aW9ucywgZGlzYXN0ZXIgbWFuYWdlbWVu
dCBwcmFjdGl0aW9uZXJzIGFuZCANCmNvbW11bml0aWVzLiBJdCBhaW1zIHRvIGluc3RpdHV0
aW9uYWxpemUgd2VhdGhlciBhbmQgY2xpbWF0ZSBpbmZvcm1hdGlvbiANCmFwcGxpY2F0aW9u
cyBmb3IgZGlzYXN0ZXIgbWl0aWdhdGlvbi4NCk5vIA0Kb2YgRGF5cw0KNSANCmRheXMNCkNv
dXJzZSANCk9iamVjdGl2ZXMNCkVmZmVjdGl2ZWx5IA0KICBpbnRlZ3JhdGUgc2NpZW50aWZp
YyBhbmQgdGVjaG5pY2FsIGlucHV0cyBpbnRvIGVhcmx5IHdhcm5pbmcgZGlzc2VtaW5hdGlv
biBhbmQgDQogIGNvbW11bmljYXRpb24gc3lzdGVtDQpBcHBseSANCiAgZW1lcmdpbmcgZ2Vu
ZXJhdGlvbiBjbGltYXRlIHByZWRpY3Rpb24gdGVjaG5vbG9naWVzIGZvciBhbnRpY2lwYXRp
bmcgYW5kIA0KICBtYW5hZ2luZyBkaXNhc3RlciByaXNrcyBhc3NvY2lhdGVkIHdpdGggY2xp
bWF0ZSBjaGFuZ2UgJiANCiAgdmFyaWFiaWxpdHnCoA0KRGV2ZWxvcCANCiAgc3RyYXRlZ2ll
cyB0byBpbnN0aXR1dGlvbmFsaXplIGVhcmx5IHdhcm5pbmcgc3lzdGVtcyBpbnRvIHRoZSBw
cm9jZXNzIGN5Y2xlIG9mIA0KICBkaXNhc3RlciByaXNrIG1hbmFnZW1lbnQgYW5kIGRldmVs
b3BtZW50IHBsYW5uaW5nLCBlbWVyZ2VuY3kgcmVzcG9uc2UsIGFuZCANCiAgcHJlcGFyZWRu
ZXNzIGFjdGl2aXRpZXMNCkRldmVsb3AgDQogIHJpc2sgY29tbXVuaWNhdGlvbiAmIGNvbW11
bmljYXRpb24gdGVjaG5vbG9naWVzDQpJbnRlcnByZXQgDQogIHNjaWVudGlmaWMgaW5mb3Jt
YXRpb24gcHJvZHVjdHMgaW50byB1c2VyIGZyaWVuZGx5IGZvcm1hdHMgYW5kIHByZXBhcmUg
JiANCiAgY29tbXVuaWNhdGUgdGFpbG9yIG1hZGUgZWFybHkgd2FybmluZyBpbmZvcm1hdGlv
biBwcm9kdWN0cw0KRGVzaWduIA0KICBhbmQgaW1wbGVtZW50IGNvbW11bml0eSBiYXNlZCBl
YXJseSB3YXJuaW5nIHN5c3RlbXMgdGhhdCBhcmUgcGVvcGxlIA0KICBjZW50ZXJlZA0KRXZh
bHVhdGUgDQogIGFuZCBpbnRyb2R1Y2UgcHVibGljIGVkdWNhdGlvbiBhbmQgdHJhaW5pbmcg
cHJvZ3JhbSBmb3IgdGhlIGNvbW11bml0eSBiYXNlZCANCiAgZWFybHkgd2FybmluZyBzeXN0
ZW1zDQpVbmRlcnRha2UgDQogIHJpc2sgYXNzZXNzbWVudCBhbmQgZGVzaWduIG9mIG11bHRp
LWhhemFyZCBlYXJseSB3YXJuaW5nIHN5c3RlbXMgZm9yIGRpc2FzdGVyIA0KICByaXNrIHJl
ZHVjdGlvbg0KQXBwbHkgDQogIEdJUyBhbmQgUmVtb3RlIFNlbnNpbmcgZm9yIGRlc2lnbmlu
ZyBpbXBsZW1lbnRhdGlvbnMgb2YgbGFyZ2Ugc2NhbGUgZWFybHkgDQogIHdhcm5pbmcgc3lz
dGVtcyBhbmQgUGFydGljaXBhdG9yeSBHSVMgc2tpbGxzIGZvciBjb21tdW5pdHkgRWFybHkg
V2FybmluZyANCiAgU3lzdGVtcw0KQXBwbHkgDQogIE1vYmlsZSBEYXRhIEdhdGhlcmluZyB0
ZWNobm9sb2dpZXMgZm9yIHJhcGlkIGFzc2Vzc21lbnQgYW5kIA0KICBzdXJ2ZXlzDQpDb3Vy
c2UgDQpDb250ZW50DQpNdWx0aSANCkhhemFyZCBFYXJseSBXYXJuaW5nIFN5c3RlbXMgQ29u
Y2VwdA0KQ29uY2VwdHMgDQogIGFuZCBtYWluIGZyYW1ld29ya3MgaW4gTXVsdGkgSGF6YXJk
IEVhcmx5IFdhcm5pbmcgU3lzdGVtcw0KV2VhdGhlciwgDQogIENsaW1hdGUgYW5kIEF0bW9z
cGhlcmljIFByb2Nlc3Nlcw0KT2JzZXJ2ZWQgDQogIENsaW1hdGUgQ2hhbmdlIGFuZCBJbXBh
Y3RzDQpDbGltYXRlIA0KICBQcmVkaWN0aW9ucyBhbmQgTWFqb3IgU291cmNlcyBvZiBVbmNl
cnRhaW50eQ0KQmFzaWMgDQpjb25jZXB0cyBvZiBSZW1vdGUgU2Vuc2luZyBhbmQgR0lTDQpC
YXNpYyANCiAgY29uY2VwdHMgb2YgR0lTIGFuZCBSZW1vdGUgU2Vuc2luZyBpbiB0aGUgY29u
dGV4dCBvZiBFYXJseSBXYXJuaW5nIA0KICBTeXN0ZW1zDQpIYW5kbGluZyANCiAgc3BhdGlh
bCBpbmZvcm1hdGlvbiBJOiAoVXNpbmcgUXVhbnR1bSBHSVMpDQpTcGF0aWFsIA0KICBSZWZl
cmVuY2UgU3lzdGVtcyAmIGRhdGEgaW50ZWdyYXRpb24NCkhhbmRsaW5nIA0KICBzcGF0aWFs
IGluZm9ybWF0aW9uIElJOiBHUFMtYmFzZWQgZmllbGQgZGF0YSBjb2xsZWN0aW9uDQpJbnRy
b2R1Y3Rpb24gDQp0byBSaXNrIElkZW50aWZpY2F0aW9uIGFuZCBhc3Nlc3NtZW50DQpJbnRy
b2R1Y3Rpb24gDQogIHRvIFJpc2sgSWRlbnRpZmljYXRpb24gYW5kIGFzc2Vzc21lbnQgdXNp
bmcgU3BhdGlhbCBUZWNobm9sb2dpZXMNCk1vYmlsZSANCiAgZGF0YSBnYXRoZXJpbmcgZm9y
IGZpZWxkIGFzc2Vzc21lbnRzL3N1cnZleXMgdXNpbmcgT3BlbiBEYXRhIA0KICBLaXTCoA0K
SGFuZGxpbmcgDQogIHNwYXRpYWwgaW5mb3JtYXRpb24gSUlJOiBWaXN1YWxpemF0aW9uIG9m
IHJpc2sgaW5mb3JtYXRpb27CoA0KSGF6YXJkIA0KICBkZXRlY3Rpb24sIG1vbml0b3Jpbmcs
IGZvcmVjYXN0aW5nIGFuZCB3YXJuaW5nDQpTcGF0aWFsIA0KaW5mb3JtYXRpb24NCkhhbmRs
aW5nIA0KICBzcGF0aWFsIGluZm9ybWF0aW9uIElWOiBTYXRlbGxpdGUgaW1hZ2UgcHJvY2Vz
c2luZyB0ZWNobmlxdWVzIGZvciBjaGFuZ2UgDQogIGRldGVjdGlvbiAoVXNpbmcgSUxXSVMp
DQpFYXJseSANCiAgd2FybmluZyBkaXNzZW1pbmF0aW9uIGFuZCBjb21tdW5pY2F0aW9uDQpD
b21tdW5pY2F0aW9uIA0KICBwcm90b2NvbHMNClB1YmxpYyANClBhcnRpY2lwYXRvcnkgR0lT
DQpQdWJsaWMgDQogIFBhcnRpY2lwYXRvcnkgR0lTDQpHb29nbGUgDQogIEVhcnRoLCBNYXBz
DQpTb2NpYWwgDQogIE5ldHdvcmtpbmcgSW50ZWdyYXRpb24NCkNvbW11bml0eS1iYXNlZCAN
CiAgZWFybHkgd2FybmluZyBzeXN0ZW1zDQpCdWlsZGluZyANCiAgaGF6YXJkLWF3YXJlIGFu
ZCByZWFkeSBjb21tdW5pdGllcw0KTW9uaXRvcmluZyANCiAgYW5kIGV2YWx1YXRpb24gb2Yg
ZWFybHkgd2FybmluZyBzeXN0ZW0NCsKgDQpHZW5lcmFsIA0KTm90ZXMNCsK3wqDCoMKgwqDC
oMKgwqDCoMKgQWxsIA0Kb3VyIGNvdXJzZXMgY2FuIGJlIFRhaWxvci1tYWRlIHRvIHBhcnRp
Y2lwYW50cyBuZWVkcw0KwrfCoMKgwqDCoMKgwqDCoMKgwqBUaGUgDQpwYXJ0aWNpcGFudCBt
dXN0IGJlIGNvbnZlcnNhbnQgd2l0aCBFbmdsaXNoDQrCt8KgwqDCoMKgwqDCoMKgwqDCoFBy
ZXNlbnRhdGlvbnMgDQphcmUgd2VsbCBndWlkZWQsIHByYWN0aWNhbCBleGVyY2lzZSwgd2Vi
IGJhc2VkIHR1dG9yaWFscyBhbmQgZ3JvdXAgd29yay4gT3VyIA0KZmFjaWxpdGF0b3JzIGFy
ZSBleHBlcnQgd2l0aCBtb3JlIHRoYW4gMTB5ZWFycyBvZiBleHBlcmllbmNlLg0KwrfCoMKg
wqDCoMKgwqDCoMKgwqBVcG9uIA0KY29tcGxldGlvbiBvZiB0cmFpbmluZyB0aGUgcGFydGlj
aXBhbnQgd2lsbCBiZSBpc3N1ZWQgd2l0aCBGb3Njb3JlIGRldmVsb3BtZW50IA0KY2VudGVy
IGNlcnRpZmljYXRlIChGREMtSykNCsK3wqDCoMKgwqDCoMKgwqDCoMKgVHJhaW5pbmcgDQp3
aWxsIGJlIGRvbmUgYXQgRm9zY29yZSBkZXZlbG9wbWVudCBjZW50ZXIgKEZEQy1LKSBjZW50
ZXIgaW4gTmFpcm9iaSBLZW55YS4gV2UgDQphbHNvIG9mZmVyIG1vcmUgdGhhbiBmaXZlIHBh
cnRpY2lwYW50cyB0cmFpbmluZyBhdCByZXF1ZXN0ZWQgbG9jYXRpb24gd2l0aGluIA0KS2Vu
eWEsIG1vcmUgdGhhbiB0ZW4gcGFydGljaXBhbnQgd2l0aGluIGVhc3QgQWZyaWNhIGFuZCBt
b3JlIHRoYW4gdHdlbnR5IA0KcGFydGljaXBhbnQgYWxsIG92ZXIgdGhlIHdvcmxkLg0KwrfC
oMKgwqDCoMKgwqDCoMKgwqBDb3Vyc2UgDQpkdXJhdGlvbiBpcyBmbGV4aWJsZSBhbmQgdGhl
IGNvbnRlbnRzIGNhbiBiZSBtb2RpZmllZCB0byBmaXQgYW55IG51bWJlciBvZiANCmRheXMu
DQrCt8KgwqDCoMKgwqDCoMKgwqDCoFRoZSANCmNvdXJzZSBmZWUgaW5jbHVkZXMgZmFjaWxp
dGF0aW9uIHRyYWluaW5nIG1hdGVyaWFscywgMiBjb2ZmZWUgYnJlYWtzLCBidWZmZXQgDQps
dW5jaCBhbmQgYSBDZXJ0aWZpY2F0ZSBvZiBzdWNjZXNzZnVsIGNvbXBsZXRpb24gb2YgVHJh
aW5pbmcuIFBhcnRpY2lwYW50cyB3aWxsIA0KYmUgcmVzcG9uc2libGUgZm9yIHRoZWlyIG93
biB0cmF2ZWwgZXhwZW5zZXMgYW5kIGFycmFuZ2VtZW50cywgYWlycG9ydCANCnRyYW5zZmVy
cywgdmlzYSBhcHBsaWNhdGlvbiBkaW5uZXJzLCBoZWFsdGgvYWNjaWRlbnQgaW5zdXJhbmNl
IGFuZCBvdGhlciANCnBlcnNvbmFsIGV4cGVuc2VzLg0KwrfCoMKgwqDCoMKgwqDCoMKgwqBG
b3IgDQphbnkgZW5xdWlyeSB0bzrCoHRyYWluaW5nQGZkYy1rLm9yZ8Kgb3IgKzI1NDcxMjI2
MDAzMQ0KwrfCoMKgwqDCoMKgwqDCoMKgwqBXZWJzaXRlOnd3dy5mZGMtay5vcmcNCsKgDQpP
dGhlciB1cGNvbWluZyB3b3Jrc2hvcHMgDQpNYXJjaCANCjIwMjIoTmFpcm9iaSxrZW55YXxt
b21iYXNhLGtlbnlhfHJ3YW5kYSxraWdhbGl8ZHViYWkpDQrCt8KgwqDCoMKgwqDCoMKgwqAg
DQoNCjxodHRwOi8vdHJhY2tpbmcuZmRjLWsuYWZyaWNhL3RyYWNraW5nL2NsaWNrP2Q9dElN
aWZ4MEt2YTdFRkh4Tzl4UWtrcGhNOXNzZ3ZGczF1aGdGQlBraEt2Zi1oOGtEYjBVZkd4WEJT
alJhNUdhSkVsYzAweUVzS25kMXB5WEgza2x6QVhJWkhwWkV5dnh5WUxjbWhGQkhCVklQSnps
SldhVzFMb2RFbl8xUnBfWlBvX2cyMmpfaUJabjlIdFdobWp0cnBrVFRjV09vYnFDak5IcWVI
X0xzWTZkUlZtWUVDUEdGQkJXbVZCN1F0S1JzSEZDUnREU0xjei1qX2JmMzNUbVJ1Z1ZCLUlz
YVpCcWpCNDU2cmpzSFRjaWtRLVR5V1VBVUNKR3EySFM1RHFaVV9kYXpzcXJ0X1pSbHVLd1FH
XzVNX0dVMT4NClF1YWxpdGF0aXZlIA0KRGF0YSBNYW5hZ2VtZW50IGFuZCBBbmFseXNpcyB3
aXRoIE5WSVZPIFdvcmtzaG9wDQrCt8KgwqDCoMKgwqDCoMKgwqAgDQoNCjxodHRwOi8vdHJh
Y2tpbmcuZmRjLWsuYWZyaWNhL3RyYWNraW5nL2NsaWNrP2Q9d1BlUXZ3SG1tTG9IQ0RoUkEx
QWlMclNxY2lubThkdFdqcEZ0bzIycnJxS0hIbFFWZUo1dWlKREhNOEgwOGl1WmE4Ym9xTktM
czhMS0pHYk5kTVhpQlZ0d19XNmx2bWFIb25Ha1VqcnhtRnZ0amp6Wm5EWjcxb2RmSWlvQmNx
eXVMNHlmai1URVkwaWFFWUY1M3h4S2tBck11Tld5Vlg1YzR2RkxrQVlCb2pRcWQ2QWJ4YzVY
bHZpNXRMX2Vna1VEYW1OeWYzdjNTbWppUXVYcmZnYzRoeExNQm1JRFlMbkVFZnByRUxKaVZT
cmtzcXQ2REJhYVAwR0JjLWVxNjR5cWR3Mj4NCkdlbmRlciANCkVxdWl0eSBBY2hpZXZlbWVu
dCBpbiBEZXZlbG9wbWVudCBQcm9qZWN0cyBXb3Jrc2hvcA0KwrfCoMKgwqDCoMKgwqDCoMKg
IA0KDQo8aHR0cDovL3RyYWNraW5nLmZkYy1rLmFmcmljYS90cmFja2luZy9jbGljaz9kPW1X
V2diaTB2WGU2eVBSdkZ6NTFqakg2V2lKNUtmbmJ0M0M4SW1TYk01cHlnQUFkVTdoUlIxWU9l
M1NDNVRxRngxMVBGS0duT3ZtRzJWMV9YRFB1dkxBb29ubS1yeGtudXFPdlYzQ0hraWJBZndo
N2tUbGlKeXhsT0wxN2VzZDVGaHRFNE1qN1dkSzdhUW1pVS1RV1NBQWp1eTlabXRqWUh0d2hl
TDJ4QjVwNjlwQWJGZVpMVUJZSzh3MV9yR2RqSmVpQXBoRER4QlVNcktvc1pMWGs4bDBVU3RS
T3BqRHQzNVgyYm1MVjdfWEtSSjNvX3FYZkpFdzR5V3dNSGpkMmwyQTI+DQpBZHZhbmNlZCAN
CkV4Y2VsIEZvcm11bGFzIGFuZCBGdW5jdGlvbnMgV29ya3Nob3ANCsK3wqDCoMKgwqDCoMKg
wqDCoCANCg0KPGh0dHA6Ly90cmFja2luZy5mZGMtay5hZnJpY2EvdHJhY2tpbmcvY2xpY2s/
ZD1GWlozYVBpS2ExbXl6MVRNeUN5Y0tEMVlJa2gwUmpaQnprUXNmMmxsNFBWbmZSdzNWeVFM
dWRLQ29JVXY5bWNRMXJMcFZ0eGtzVkVVU3dUZTU2RGRTbzFBZndkNm1scDd3SmRfTFlQZnJE
MWE4RDNic2pRR2tEcVhfY2Iwb2hTZGN2X2p3Si1Ucjc5U0h3RjV4QTJyZ3NLTTJZaW9qemQt
d2FTMEhSbVBMR3NxNWh5Mlo3WW9fTC1wZFlGakJLeUgwa05Qak1GWmdkbUFjbE9HNDA5b1Vi
SHFUbFhaUGVfemd2a2l5cEh2bHVBUW1lTXZ5S0lUZ3gyemlxVnhGQVpJZ1EyPg0KVHJhbnNm
b3JtYXRpb25hbCANCkxlYWRlcnNoaXAgYW5kIEdvdmVybmFuY2UgV29ya3Nob3AgDQrCt8Kg
wqDCoMKgwqDCoMKgwqAgDQoNCjxodHRwOi8vdHJhY2tpbmcuZmRjLWsuYWZyaWNhL3RyYWNr
aW5nL2NsaWNrP2Q9YzNQR3NxaVFiYkVTU2JNc053Y0NsaWdvcnpKMkMzcWpmTmhzXzYyNUVF
bkJpdHlzVnFsNEpiM0xsejhhY2tmaVY3eXRXUi0zcW5PS1ltZnNOamViVi1MRkRpdktfaGJY
M1M1UGc4YmpEcnBoakYwVDFnaDN0aE5KRkVzdHFPMG5qeml0Q3J2WmlHX3kxYmtHQ2V5YlNz
eHp0Q3RUaTR1VzJQdUVDNlRKTUtnR3BFSmdqMmNrVk0wdXhIUjJKMHFObF9GWXZrbjBOTTJV
c1hOQmxDbDVCSmh3aG85a0lpVi16blBBbTVPSEt2cWl0VVZ0dFhCUXIzMWRtYWY1WVljb0x0
ZGhNRGU2ekdWYXBaNEpJUzhRRkZuMnVseF9ralZWZ19aSDBfWjNuOS1KMD4NClByb2plY3Qg
DQpJbmZvcm1hdGlvbiBNYW5hZ2VtZW50IFN5c3RlbSBmb3IgRGV2ZWxvcG1lbnQgT3JnYW5p
emF0aW9ucyBhbmQgTkdPcyANCldvcmtzaG9wDQrCt8KgwqDCoMKgwqDCoMKgwqAgDQoNCjxo
dHRwOi8vdHJhY2tpbmcuZmRjLWsuYWZyaWNhL3RyYWNraW5nL2NsaWNrP2Q9SDBKNG9pX2V2
NmE5N3hPUTVZLTRtSzRZdTU1WVc0VkxoRmp5enN1WGNsZlIwdVpaQUVKa3JxMmczUW9kb09t
M2g2cGIxb2tJS3Jya2ZrS05zQUU3Y2wzX2tHQlpGNFcxMi1GZ3lwTEFTcThpNWR4UUtNakFU
eEoxclozRk9ZV2wtalpRN1RvODNxR1plSWFlT0F5OTg4SkkzZGNzYWFjRFFNZGZGQndEbzlO
OTlqdzVTSG1FMWRNTTR2US1RbWhGcmdaY3RyY3FTRTFpNXNDNmNMSmw4UDd1V0xzT1VMSXBy
OU9Ic2JUeWF2S3J2Ykk4Q3oyb29zWWFVTnpDcnlsTHBRMj4NCkh1bWFuIA0KUmVzb3VyY2Vz
IE1hbmFnZW1lbnQsIERldmVsb3BtZW50IGFuZCBBdWRpdGluZyBXb3Jrc2hvcA0KwrfCoMKg
wqDCoMKgwqDCoMKgIA0KDQo8aHR0cDovL3RyYWNraW5nLmZkYy1rLmFmcmljYS90cmFja2lu
Zy9jbGljaz9kPXQ4YkxCYW8zU0Z3bGx4YWYxQXV2dzM1eGhpZkYzZGY1NGRJRUJQS0NMX2lH
aUNqalBuWm1fSThnMDB0Y05lRzhTTjB4aWdiRnYxS2hqUHlNblFEZjhELVItNlFEQ1cyNkJQ
Rkh5TXJXOHVnZHR1ZzNUSHQ1ZGliNDc1M1BkWHcxU2Y5ajNnUDJab3RIaDhFWjN2SHgxRlBj
SDllVUhLdTJudzMzMmNzdjdXc0tzQW9uUUZEeHQ2cHl4cnd3YXVRVTlwMEdGRVZZU0xaNkZ6
VC14WW9tdkc5UldEc0JKWDZ2WTMwaEZFSk9PdTRiMD4NCkdJUyANCkFwcGxpY2F0aW9uIGlu
IERpc2FzdGVyIFJpc2sgUmVkdWN0aW9uIFdvcmtzaG9wDQrCt8KgwqDCoMKgwqDCoMKgwqAg
DQoNCjxodHRwOi8vdHJhY2tpbmcuZmRjLWsuYWZyaWNhL3RyYWNraW5nL2NsaWNrP2Q9bk9j
OFE2LUduS1ZVSXBnUlBIdnVDTGpPbk9BNXNZdFBGbDdpOS1GM2JIN2tMdExZZHp3QkEzOXBw
YTRramhBbFF6aE55Y2lNVzhlQlNSSWE1NFN2MnhuVnlDak5OQ0paSFljUHlNSF9yaVQzTjhx
cEh5Q2wzS1lycXRFelBIazh2X0VIcVEtdjdEZ2RCQldFUGVSUGNRYVo0MFliRzBTdVB0ejda
THpacnludXpidkU4Tm9hRkV6VXJqaG9pWTl3Sl9mUzNkSE90bS1zVXZpUUNxRkpsUTFLWVBX
Y0NWN05Hb3V6NDU0MmlsZ1FzV1E3bnVlN2xaa3pIOE5RdmQ2OVZXd3ZZeGl6bTJkSmVrRjRv
aG43NmdjMT4NCkRhdGEgDQpBbmFseXNpcywgTW9kZWxpbmcgYW5kIFNpbXVsYXRpb24gdXNp
bmcgRXhjZWwgV29ya3Nob3AgDQrCt8KgwqDCoMKgwqDCoMKgwqAgDQoNCjxodHRwOi8vdHJh
Y2tpbmcuZmRjLWsuYWZyaWNhL3RyYWNraW5nL2NsaWNrP2Q9NXltbWdJTEJpb29oVVd4a21Q
X1BGMEI5MUl3ZzR0ZGNrcmRqRVZ6ZkJnNFViQUJnSWZCT290ZTNQakVjYU5QV2d1Y0VGblp3
Wlp3SWV2NTZwanRYcmZadDVWdnJub05kQkNzdndtcXVEcjNMRUpWOWRjMWJ5a1hmZGgtMzBC
WHl3b21XQ3diZ1R3NTFOQ1VlNHlWQ2RKanRQTDEzNlhqY3FoYUU0R0xWeE4tV3p6NTVUZ2w2
VlFYdFo3ZlRWWUphcVNxeDZpc3l6SzFqQUs2UmJfWlNjbFk1ZXM3Rm1aa0dGTUJxeDBINWZC
dldpTXRoRDY0RHZlbF9DYkFPa0J0a0JRMj4NClF1YW50aXRhdGl2ZSANCkRhdGEgTWFuYWdl
bWVudCBhbmQgQW5hbHlzaXMgd2l0aCBTVEFUQSBXb3Jrc2hvcA0KwrfCoMKgwqDCoMKgwqDC
oMKgIA0KDQo8aHR0cDovL3RyYWNraW5nLmZkYy1rLmFmcmljYS90cmFja2luZy9jbGljaz9k
PXJXN2t2OWFlM1JJWkdOTEVKUEFtYkdvSXpiYXhXT2dlS29kUTJwcUFVSlRZa2FKc3JseV9Z
SkQyNTBxaHp4WFRzWEZoTVJVbkVKbDVLSTJhSjJVWTNKQXRuYnpKUzdBdFZONUNyd3dyYTdI
MnBjalVpYW9wcTlzRlZkaHA4TGtoQk01Z2RBVy1qNVBqOEVvNWlfSXhGQ2V3a3JralZldms3
R0NBVVIxLVVPRnlLOEQ2dHE2a3FZal9ETzBOUVRuQzgzNnQzS0lQRllkbThHbmtnWGJFOFE4
ZlFLNTZLMXNodXk2dkxaOXhfN0JrU2NjSlVKVGM5ekxTV3d1blJmZ0JsZzI+DQpEZXZlbG9w
aW5nIA0Kb3JnYW5pemF0aW9uIEJhbGFuY2VkIFNjb3JlY2FyZCBXb3Jrc2hvcA0KwrfCoMKg
wqDCoMKgwqDCoMKgIA0KDQo8aHR0cDovL3RyYWNraW5nLmZkYy1rLmFmcmljYS90cmFja2lu
Zy9jbGljaz9kPXQ4YkxCYW8zU0Z3bGx4YWYxQXV2dzM1eGhpZkYzZGY1NGRJRUJQS0NMX2lH
aUNqalBuWm1fSThnMDB0Y05lRzhTTjB4aWdiRnYxS2hqUHlNblFEZjhELVItNlFEQ1cyNkJQ
Rkh5TXJXOHVnZHR1ZzNUSHQ1ZGliNDc1M1BkWHcxU2Y5ajNnUDJab3RIaDhFWjN2SHgxSnkz
VE9VM1RDQ2Q4MHdsclV6aXdnMTlqQ21pR2JoQ0F1cTlnRldEdjFVUVVEMmxWZGEwUHdNampD
eUV5Z3FocHFwMFJpTDRtZGhLWnlZN0pvS1dySUVzMD4NClB1YmxpYyANCkhlYWx0aCBpbiBX
QVNIIGR1cmluZyBFbWVyZ2VuY2llcyBXb3Jrc2hvcA0KwrfCoMKgwqDCoMKgwqDCoMKgIA0K
DQo8aHR0cDovL3RyYWNraW5nLmZkYy1rLmFmcmljYS90cmFja2luZy9jbGljaz9kPU9INEIt
bjkzNExOaWNpZHVsX2g4V0JtZS1LQnBTcGpJek5lRGplZTJIQVVsMFNka1hRSjZpUkJSUmRF
UmFRV25lQ2lycnM3WkYtZTQwcVplNzVmZS1OYkk2UVFvY2NZR0lzaV9QRXRnTGMzZnVDbDZK
NDJaWmM5cUZfaWtIRkhtbUNGdlRtbE1ubU5NUHhhZmJfdWhKeVFoS3FURTR4QW5Hbl8waXZZ
NDFUWnpZckxpNV9wME54ajNicG4xaG5iVWhLUHFlY0VJSWlSNlRnb2IzcFByWXoyb2tZMHkx
Zlk5MkJPQWdGU01wZXZ1Tkp3M1BGaWl6ejF1RGNvTGR3bWl1dzI+DQpNb2JpbGUgDQpEYXRh
IENvbGxlY3Rpb24gdXNpbmcgT0RLICYgS29ib1Rvb2xCb3ggV29ya3Nob3AgDQrCt8KgwqDC
oMKgwqDCoMKgwqAgDQoNCjxodHRwOi8vdHJhY2tpbmcuZmRjLWsuYWZyaWNhL3RyYWNraW5n
L2NsaWNrP2Q9bjVRc1BoY1NJVkV1VjZuUFhodTlRLW5XUF9weC1OclFwX0xqdkhaamRiN1Jr
TngzZzI2ZUZheUI5R29oZk12b1lIZ0ZTOHFnSzI5VUUwQXVQZ2Z2NjIzYk94TFo3NFJYb285
WWRaUS1SMERqRG5MSmI3bEpYM0hVUEFpLUFvcldOLVQ2RTRBeEo5VmNCcW53UXl3cGFxVXRt
bGRoWXQwek1XRFUyT2pmV24zSWRiMkNWdl9ROG1zbTh3QXJRMmdSZHZvZy1rX1hBOEhfaGxY
VUlqRU8yZFRKd3lNNmlRd2E3MGdlVEc5cC1Sa1ctYUpsOUdsLVFGZlVPR3Y2b0hPcGZpaTV6
aXAwdzRlczN5SkYtdEdXLXpBMT4NClRyYW5zZm9ybWluZywgDQphbmFseXppbmcgJiB2aXN1
YWxpemluZyBkYXRhIHdpdGggTWljcm9zb2Z0IFBvd2VyIEJJIA0KV29ya3Nob3ANCsK3wqDC
oMKgwqDCoMKgwqDCoCANCg0KPGh0dHA6Ly90cmFja2luZy5mZGMtay5hZnJpY2EvdHJhY2tp
bmcvY2xpY2s/ZD1IMEo0b2lfZXY2YTk3eE9RNVktNG1LNFl1NTVZVzRWTGhGanl6c3VYY2xk
ZkpucTFjYXVYaFNBTE54THVmR1JmcVRqUFdHQ3Rfd3NXOHJPZlp6NVBUcEEtZnc1cHJqeDR6
ejZUSEtSQkctWTBleWRIM1RYZVZ1TkZDUGdFUWE2dXlhdWtNOFpQd2cwQ25SOXpRY1YtWWpI
Y3R6ZDE0SHAwM19GT2NvbVhXZkRpWXVCUXBRZnhoN1NOR1lIUnJ3VElTdEloN3NHNDVBdXhM
Sk9BbmNiWEd2VllVLTJETHNzQ1Z5RHRwT1NWVWJHZ1NUeklFXy1MQjY1bWZ5QlFmdzh0bFEy
Pg0KUXVhbnRpdGF0aXZlIA0KRGF0YSBNYW5hZ2VtZW50IGFuZCBBbmFseXNpcyB3aXRoIFIg
V29ya3Nob3ANCsK3wqDCoMKgwqDCoMKgwqDCoCANCg0KPGh0dHA6Ly90cmFja2luZy5mZGMt
ay5hZnJpY2EvdHJhY2tpbmcvY2xpY2s/ZD1QTEhCSzEzWmlVejR3TUdkdlRRRkFVZnVWRnpP
ZEQxZzFlbEduSTVkWkloTGY2MTlnU2ZPMW1SV0VyZTFVUFoyVDRHelNFVVpvTkhtTGg2QV9m
MHRZWHZiMnNETmpGa3R4UE5ucEwyeFhCTl85QWVtc1M5aEpFNFdPd0lVZVl3R3BpdmFLaGVV
bEdvWDJwUkpsbDNQNW5FUjlOV2h4UmhKTTZSUlJoRUhJVVQ4TVBGR0VtSmoxelFFaWdiN2ll
VzI0a3loR0h1bk9ZOURXWWlnZi1zZmZGb2UwYU9LV2N2ZGZWUUVWNkpKdUZLcGVvR05oTU9v
Y0c0UkdnZGp0TXBiV2pteHdaYnJsVkUwU3ZuVnl0eU8weTAxPg0KUXVhbnRpdGF0aXZlIA0K
RGF0YSBNYW5hZ2VtZW50IGFuZCBBbmFseXNpcyB3aXRoIFNQU1MgV29ya3Nob3ANCsK3wqDC
oMKgwqDCoMKgwqDCoCANCg0KPGh0dHA6Ly90cmFja2luZy5mZGMtay5hZnJpY2EvdHJhY2tp
bmcvY2xpY2s/ZD1DeDJacm5KdDR5VGxqUkYzTGxiUjFILVU4Q3NPRWpoR3pUZ1ZqQTFBenpM
SDMxOFpYTGtXZXo3Q283TEpwS2Y1MzRjQkI0UEVWR3Bta0VSQzVVQWlFaWJ4ejUyX1VCTEU3
QmVnQ19YZldpcXFRUWZqLWR1REt4Z2xTTGcwV2tmdGhMaVJrbWJvSmxKN2RkZmdkeXVKV0Rp
UlFDRzZUcktIMW1EVVlYamllMnJYRVltSUtyV1h4VUpfTlVweUFBZUowUjhZS0NhcVNfblRp
cDlOV25xUU1MSDliVi1TeE5WZVNlZl9PYjVORm5qN3kxcFJKS09aVXl5RlVSYjNyaVlPYVNr
WW9EbEI3NVJHY09KTkppeXp3Z2kyTzYtYnZCQnJsbzM3dWJiYWIyc3MwPg0KU3RyYXRlZ2lj
IA0KQ29tbXVuaWNhdGlvbiBUcmFpbmluZyBGb3IgTWFuYWdlcnMgQW5kIEV4ZWN1dGl2ZXMg
UHJvZ3JhbSANCldvcmtzaG9wDQrCt8KgwqDCoMKgwqDCoMKgwqAgDQoNCjxodHRwOi8vdHJh
Y2tpbmcuZmRjLWsuYWZyaWNhL3RyYWNraW5nL2NsaWNrP2Q9cFVVUnl2TmlpcnYyY1c0eVdV
RXVyRlFNcWJEMV92Q2taemw4MWxDM21zR01oakp0dWUwTWNaeGYySlRtakFaRy1IOTY3YXMy
bG9DQVgtck9uRE1lMlRtTXdkdnRWNHd4eXlTam15REFXR1N3cmJHck5vQTRaU3FOVnFOb2NN
bkJFZGlEVnc4RWhCRUNDN3JkaDgyTWlaalN1UUZpUVhpaW0wR3Z2YUVIenZrcVc3c1BOZHRS
UGdfTnh4M3lqTkpQMmlxZjhMQmw1MW9ibXRzM1F5WkJ2OHlEeFZ6N3RlT2tOaWoyNmRxYlY0
TFJVc1V4S1JkdW9KNDltRWluTW1MdDFBMj4NCkdyYW50IA0KTWFuYWdlbWVudCB1c2luZyBT
dW4gQWNjb3VudGluZyBTeXN0ZW0gV29ya3Nob3ANCsK3wqDCoMKgwqDCoMKgwqDCoCANCg0K
PGh0dHA6Ly90cmFja2luZy5mZGMtay5hZnJpY2EvdHJhY2tpbmcvY2xpY2s/ZD1sMkhvSTd2
NVE0R1VsM3p2Mi0tWktJSWt1M1BEUU5meldkb2xyWXlhZV9xSUs3bGRPMkNpRU1uODljdnhk
VjhNQUJnbllyanEzOW9yMkxDRFRMMmVwQ1FLSEhlVkdnUDljejlxejh4dU1rQ25ET2pISkZ0
clRXbHdLVmJmbTQwVDc3WHM5XzNSRFRqTVhsMDkxTzFtcUc0dzJnOEJWMFJRR0duSWNzLTRi
bTZ6YUpjYTRYck1QWVlrN2VsbW1hSUNxN3Ftd2tENy14Xy0zS0k4OHMyWFdCNkFnbDVaX0o2
NnlxVGR6NDlORk50RFllRDhuUVQ2Ui1iVzU2MTNSM1hjUWcyPg0KUmVzZWFyY2ggDQpEZXNp
Z24sIE9ESyBNb2JpbGUgRGF0YSBDb2xsZWN0aW9uLCBHSVMgTWFwcGluZywgRGF0YSBBbmFs
eXNpcyB1c2luZyBOVklWTyBhbmQgDQpTUFNTIFdvcmtzaG9wDQrCoA0KUmVnYXJkcw0KRkRD
IA0KVHJhaW5pbmcgVGVhbQ0KRm9yIA0KYW55IGlucXVpcnkgdG86wqB0cmFpbmluZ0BmZGMt
ay5vcmfCoG9yICsyNTQ3MTIyNjAwMzEgb3IgDQo8aHR0cDovL3RyYWNraW5nLmZkYy1rLmFm
cmljYS90cmFja2luZy9jbGljaz9kPUVqeDEwa21YUDI5OU1QX3VlMHFzVlRUSEY1ZWVKc0NN
UzhhekgyX21USElSUkJVUTVIQ1RyYjNDVXBqellyb2pPSkltZHBwZWRBQndhOGdfYy1HSlpY
VXlRc3pvbW8tUUVtUl9NMTMxWW5YRHI2emNjcmtQbUE3YkxadENOWTZRUUhLTVZkdjcxT3lq
SjgtbWhrZXo4MlUxPg0KQ29udGFjdCB1cw0KwqANCjxodHRwOi8vdHJhY2tpbmcuZmRjLWsu
YWZyaWNhL3RyYWNraW5nL3Vuc3Vic2NyaWJlP2Q9bktxbm9QRDRZWUM5YS1GbHdKRW1WM0NT
Ny1fY1BsSXBxZmo3OTFfUGItVzJKZU9iMUhlLWotV05PWlJnNTZ6UDMxMzZucU1fc1dWZU10
SXNZX2pTd1dyWTFzX3hSSnFnVWxQS0FLMjdkcHB4cGJEUWdLbnFGazNXZU5pdzBJelBvQTI+
DQpVTlNVQlNDUklCRQ==

--=-eZCfUGnTqSbrN8Oqc80aRCXM3w5j+/8k/XWKzQ==
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Dunicode" http-equiv=3DContent-Ty=
pe>
<META name=3DGENERATOR content=3D"MSHTML 6.00.6000.16546"></HEAD>
<BODY>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><A=20
href=3D"http://tracking.fdc-k.africa/tracking/click?d=3DOH4B-n934LNici=
dul_h8WBme-KBpSpjIzNeDjee2HAVGVJKXjEhvr1i3nNJQq519Xtxt3z2-c0A_AMLw-RqQ=
2z1OShDLiQ_JlEPly1iX4A79GDyYdnDQ7Kf3uDoOr4B0sFquL210Wf0LoqOOS_uSpTx6JG=
ZM5PfLu13Yr625A1g_cmP_IsXiBX88KJzEwPqrf8iqq1qTsztr6j6UZGKe1ZueANYvAMnk=
8R2GY-CccK40jN0s917tp9B9xDvdNfx5cA2">Remote=20
Sensing and GIS in Multi Hazard Early Warning Systems March workshop=20
2022<?xml:namespace prefix =3D "o" ns =3D "urn:schemas-microsoft-com:o=
ffice:office"=20
/><o:p></o:p></A></SPAN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><o:p>&nbsp;</o:p><=
/SPAN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><A=20
href=3D"http://tracking.fdc-k.africa/tracking/click?d=3DOH4B-n934LNici=
dul_h8WBme-KBpSpjIzNeDjee2HAVGVJKXjEhvr1i3nNJQq519Xtxt3z2-c0A_AMLw-RqQ=
2z1OShDLiQ_JlEPly1iX4A79GDyYdnDQ7Kf3uDoOr4B0sFquL210Wf0LoqOOS_uSpTx6JG=
ZM5PfLu13Yr625A1gCtyQ9043KAsbuTuVYk5VQgs55GZM15MZUQzP_OH4qL8dIFLbDUIGW=
E7EpoI87XPslYODuPSwuUtspKVUeiKOung2">Register=20
as individual, Group or Online<o:p></o:p></A></SPAN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><o:p>&nbsp;</o:p><=
/SPAN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><A=20
href=3D"http://tracking.fdc-k.africa/tracking/click?d=3DsreBwoDzYdgj3b=
OaBCRBsUjfBl7INs8m6G7880FO93iPm6YcioMVihbGt5g9wvp7F9r8fO5UMMGvmFki9Pa_=
JCP15F270n2vx9wuVn15Ilplg2Xo9nSse39UwNV1FT7jgIudqzSipB4Hem4RTg5-PMH-sO=
IZYEPqk8j4IH5Q0Ksa0">Download our=20
calender<o:p></o:p></A></SPAN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><o:p>&nbsp;</o:p><=
/SPAN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><A=20
href=3D"http://tracking.fdc-k.africa/tracking/click?d=3DpVt24nBCIBaQho=
Uk_JoHXFvrRgFR5MPGLiMhyXxgvgyIDyXSbhI1KbL_aep7SxKdpSfnmYqyeQtH7Wz7L81z=
NMd9ygtlutxrKGiJ7mctNWy190wbIZIIH53Ed-9UgCApWbdHQwW5VOHqChaAmApP07o1">=
Download our=20
brochure<o:p></o:p></A></SPAN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><o:p>&nbsp;</o:p><=
/SPAN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Discount:=20
20% for 5 and more participants</SPAN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'></SPAN></B>&nbsp;<=
/P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><A=20
href=3D"http://tracking.fdc-k.africa/tracking/click?d=3DEjx10kmXP299MP=
_ue0qsVVgsmeCyCL2aa9hihsYn1qxuQsxujXTpidFbRdOhz8nOerCkUU1isnM_op4uU36e=
HFbhDItOnEAsU6dk63yAx86G6k056W_1_wNSRpRaHgyizR2Znh6ZuUoI4Zfdq7xTJqs1">=
Our 2022&nbsp; onsite=20
Programmes</A></SPAN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'></SPAN></B>&nbsp;<=
/P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><STRONG><A=20
href=3D"http://tracking.fdc-k.africa/tracking/click?d=3D5PkZPp48t-8Hz5=
sVatBFpn5a3epmXhM_3pncS_6Amly4m8DpULizaI5X7oDBUoFUpWKk7MSxzUS4etdXWQ9F=
C0S-waHPU0KgpATYe3RDa7ODutL1drS6clMFYZhJkoY1mH8IQkymkgg5zs-LL3HwAw81">=
Our 2022&nbsp; online=20
Programmes</A></STRONG></SPAN></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><STRONG></STRONG><=
/SPAN></SPAN>&nbsp;</P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><STRONG>Centers:</=
STRONG><STRONG><FONT=20
face=3DCalibri>Nairobi,kenya|Mombasa,kenya|Rwanda,kigali|Dubai</FONT><=
/STRONG></SPAN></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><o:p>&nbsp;</o:p><=
/SPAN></B></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>For=20
any inquiry to:&nbsp;training@fdc-k.org&nbsp;or +254712260031 or <A=20
href=3D"http://tracking.fdc-k.africa/tracking/click?d=3DEjx10kmXP299MP=
_ue0qsVTTHF5eeJsCMS8azH2_mTHIRRBUQ5HCTrb3CUpjzYrojCuf1nD3prBmAMY3PtbRJ=
CIer3jNwXRM7LEFNcQzdGXLLbX4moYIPT4XBErg0D6Ka_zCNUgBTqG9O9a2aX-D18R81">=
Contact us</A></SPAN></B></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'></SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN>&nbsp;</P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
blue; mso-fareast-font-family: "Times New Roman"'>&nbsp;</SPAN><B><SPA=
N=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Website:<A=20
href=3D"http://tracking.fdc-k.africa/tracking/click?d=3DUuhk_vr4js18Hl=
PTKSEjJYTZyhsDKm8wxy3-71gNDWBewKFA7pEl69TWPbdd8x_fvrhXA-A4rOlTgPVYZNJC=
FAdeKCjXqoodkewId6W0Xm_WuPJ5GwhJ6gaNXKFBHinM0Q2">www.fdc-k.org</A></SP=
AN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'></SPAN></B>&nbsp;<=
/P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><A=20
href=3D"http://tracking.fdc-k.africa/tracking/click?d=3DIuDb5fT4fapGEp=
KDebKZ5tAUbMyiQZKn7H5Q_UIJ_CD2G9ExyjdcvGo20NCe5SaJPnFQ4IgRZUBnYKOIm99i=
Cyuw1xtk-aoeehh5WvUfBI0m3iHSXKlV_ilsruoRGXdrSIehMf893yjEJNpAUEPMwmE1">=
Consultacies</A></SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><o:p>&nbsp;</o:p><=
/SPAN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><o:p>&nbsp;</o:p><=
/SPAN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Introduction</SPAN=
></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; TEXT-ALIGN: justify; MARGIN: 0cm 0cm 0pt; =
LINE-HEIGHT: normal"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Develop=20
the capacity of professionals to design, manage, evaluate and undertak=
e=20
improvements in people-centered early warning systems for hydro-meteor=
ological=20
&amp; geological hazards and extreme events associated with climate ch=
ange and=20
variability. It builds upon experience in building capacities on use o=
f GIS,=20
Remote Sensing and space based technologies in disaster risk managemen=
t for=20
disaster management institutions, disaster management practitioners an=
d=20
communities. It aims to institutionalize weather and climate informati=
on=20
applications for disaster mitigation.</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; TEXT-ALIGN: justify; MARGIN: 0cm 0cm 0pt; =
LINE-HEIGHT: normal"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>No=20
of Days</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; TEXT-ALIGN: justify; MARGIN: 0cm 0cm 0pt; =
LINE-HEIGHT: normal"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>5=20
days</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; TEXT-ALIGN: justify; MARGIN: 0cm 0cm 0pt; =
LINE-HEIGHT: normal"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Course=20
Objectives</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<UL type=3Ddisc>
  <LI class=3DMsoNormal=20
  style=3D"BACKGROUND: white; COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-=
HEIGHT: normal; mso-margin-top-alt: auto; mso-list: l5 level1 lfo1; ta=
b-stops: list 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Effectively=20
  integrate scientific and technical inputs into early warning dissemi=
nation and=20
  communication system</SPAN><SPAN=20
  style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'><o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"BACKGROUND: white; COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-=
HEIGHT: normal; mso-margin-top-alt: auto; mso-list: l5 level1 lfo1; ta=
b-stops: list 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Apply=20
  emerging generation climate prediction technologies for anticipating=
 and=20
  managing disaster risks associated with climate change &amp;=20
  variability&nbsp;</SPAN><SPAN=20
  style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'><o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"BACKGROUND: white; COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-=
HEIGHT: normal; mso-margin-top-alt: auto; mso-list: l5 level1 lfo1; ta=
b-stops: list 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Develop=20
  strategies to institutionalize early warning systems into the proces=
s cycle of=20
  disaster risk management and development planning, emergency respons=
e, and=20
  preparedness activities</SPAN><SPAN=20
  style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'><o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"BACKGROUND: white; COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-=
HEIGHT: normal; mso-margin-top-alt: auto; mso-list: l5 level1 lfo1; ta=
b-stops: list 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Develop=20
  risk communication &amp; communication technologies</SPAN><SPAN=20
  style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'><o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"BACKGROUND: white; COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-=
HEIGHT: normal; mso-margin-top-alt: auto; mso-list: l5 level1 lfo1; ta=
b-stops: list 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Interpret=20
  scientific information products into user friendly formats and prepa=
re &amp;=20
  communicate tailor made early warning information products</SPAN><SP=
AN=20
  style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'><o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"BACKGROUND: white; COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-=
HEIGHT: normal; mso-margin-top-alt: auto; mso-list: l5 level1 lfo1; ta=
b-stops: list 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Design=20
  and implement community based early warning systems that are people=20
  centered</SPAN><SPAN=20
  style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'><o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"BACKGROUND: white; COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-=
HEIGHT: normal; mso-margin-top-alt: auto; mso-list: l5 level1 lfo1; ta=
b-stops: list 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Evaluate=20
  and introduce public education and training program for the communit=
y based=20
  early warning systems</SPAN><SPAN=20
  style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'><o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"BACKGROUND: white; COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-=
HEIGHT: normal; mso-margin-top-alt: auto; mso-list: l5 level1 lfo1; ta=
b-stops: list 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Undertake=20
  risk assessment and design of multi-hazard early warning systems for=
 disaster=20
  risk reduction</SPAN><SPAN=20
  style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'><o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"BACKGROUND: white; COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-=
HEIGHT: normal; mso-margin-top-alt: auto; mso-list: l5 level1 lfo1; ta=
b-stops: list 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Apply=20
  GIS and Remote Sensing for designing implementations of large scale =
early=20
  warning systems and Participatory GIS skills for community Early War=
ning=20
  Systems</SPAN><SPAN=20
  style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'><o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"BACKGROUND: white; COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-=
HEIGHT: normal; mso-margin-top-alt: auto; mso-list: l5 level1 lfo1; ta=
b-stops: list 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Apply=20
  Mobile Data Gathering technologies for rapid assessment and=20
  surveys</SPAN><SPAN=20
  style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'><o:p></o:p></SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; TEXT-ALIGN: justify; MARGIN: 0cm 0cm 0pt; =
LINE-HEIGHT: normal"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Course=20
Content</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal">=
<B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Multi=20
Hazard Early Warning Systems Concept</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<UL type=3Ddisc>
  <LI class=3DMsoNormal=20
  style=3D"BACKGROUND: white; COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-=
HEIGHT: normal; mso-margin-top-alt: auto; mso-list: l0 level1 lfo2; ta=
b-stops: list 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Concepts=20
  and main frameworks in Multi Hazard Early Warning Systems</SPAN><SPA=
N=20
  style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'><o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"BACKGROUND: white; COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-=
HEIGHT: normal; mso-margin-top-alt: auto; mso-list: l0 level1 lfo2; ta=
b-stops: list 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Weather,=20
  Climate and Atmospheric Processes</SPAN><SPAN=20
  style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'><o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"BACKGROUND: white; COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-=
HEIGHT: normal; mso-margin-top-alt: auto; mso-list: l0 level1 lfo2; ta=
b-stops: list 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Observed=20
  Climate Change and Impacts</SPAN><SPAN=20
  style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'><o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"BACKGROUND: white; COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-=
HEIGHT: normal; mso-margin-top-alt: auto; mso-list: l0 level1 lfo2; ta=
b-stops: list 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Climate=20
  Predictions and Major Sources of Uncertainty</SPAN><SPAN=20
  style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'><o:p></o:p></SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal">=
<B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Basic=20
concepts of Remote Sensing and GIS</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<UL type=3Ddisc>
  <LI class=3DMsoNormal=20
  style=3D"BACKGROUND: white; COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-=
HEIGHT: normal; mso-margin-top-alt: auto; mso-list: l1 level1 lfo3; ta=
b-stops: list 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Basic=20
  concepts of GIS and Remote Sensing in the context of Early Warning=20
  Systems</SPAN><SPAN=20
  style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'><o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"BACKGROUND: white; COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-=
HEIGHT: normal; mso-margin-top-alt: auto; mso-list: l1 level1 lfo3; ta=
b-stops: list 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Handling=20
  spatial information I: (Using Quantum GIS)</SPAN><SPAN=20
  style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'><o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"BACKGROUND: white; COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-=
HEIGHT: normal; mso-margin-top-alt: auto; mso-list: l1 level1 lfo3; ta=
b-stops: list 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Spatial=20
  Reference Systems &amp; data integration</SPAN><SPAN=20
  style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'><o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"BACKGROUND: white; COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-=
HEIGHT: normal; mso-margin-top-alt: auto; mso-list: l1 level1 lfo3; ta=
b-stops: list 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Handling=20
  spatial information II: GPS-based field data collection</SPAN><SPAN=20
  style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'><o:p></o:p></SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal">=
<B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Introduction=20
to Risk Identification and assessment</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<UL type=3Ddisc>
  <LI class=3DMsoNormal=20
  style=3D"BACKGROUND: white; COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-=
HEIGHT: normal; mso-margin-top-alt: auto; mso-list: l4 level1 lfo4; ta=
b-stops: list 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Introduction=20
  to Risk Identification and assessment using Spatial Technologies</SP=
AN><SPAN=20
  style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'><o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"BACKGROUND: white; COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-=
HEIGHT: normal; mso-margin-top-alt: auto; mso-list: l4 level1 lfo4; ta=
b-stops: list 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Mobile=20
  data gathering for field assessments/surveys using Open Data=20
  Kit&nbsp;</SPAN><SPAN=20
  style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'><o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"BACKGROUND: white; COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-=
HEIGHT: normal; mso-margin-top-alt: auto; mso-list: l4 level1 lfo4; ta=
b-stops: list 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Handling=20
  spatial information III: Visualization of risk information&nbsp;</SP=
AN><SPAN=20
  style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'><o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"BACKGROUND: white; COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-=
HEIGHT: normal; mso-margin-top-alt: auto; mso-list: l4 level1 lfo4; ta=
b-stops: list 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Hazard=20
  detection, monitoring, forecasting and warning</SPAN><SPAN=20
  style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'><o:p></o:p></SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal">=
<B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Spatial=20
information</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<UL type=3Ddisc>
  <LI class=3DMsoNormal=20
  style=3D"BACKGROUND: white; COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-=
HEIGHT: normal; mso-margin-top-alt: auto; mso-list: l6 level1 lfo5; ta=
b-stops: list 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Handling=20
  spatial information IV: Satellite image processing techniques for ch=
ange=20
  detection (Using ILWIS)</SPAN><SPAN=20
  style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'><o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"BACKGROUND: white; COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-=
HEIGHT: normal; mso-margin-top-alt: auto; mso-list: l6 level1 lfo5; ta=
b-stops: list 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Early=20
  warning dissemination and communication</SPAN><SPAN=20
  style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'><o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"BACKGROUND: white; COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-=
HEIGHT: normal; mso-margin-top-alt: auto; mso-list: l6 level1 lfo5; ta=
b-stops: list 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Communication=20
  protocols</SPAN><SPAN=20
  style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'><o:p></o:p></SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal">=
<B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Public=20
Participatory GIS</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<UL type=3Ddisc>
  <LI class=3DMsoNormal=20
  style=3D"BACKGROUND: white; COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-=
HEIGHT: normal; mso-margin-top-alt: auto; mso-list: l3 level1 lfo6; ta=
b-stops: list 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Public=20
  Participatory GIS</SPAN><SPAN=20
  style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'><o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"BACKGROUND: white; COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-=
HEIGHT: normal; mso-margin-top-alt: auto; mso-list: l3 level1 lfo6; ta=
b-stops: list 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Google=20
  Earth, Maps</SPAN><SPAN=20
  style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'><o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"BACKGROUND: white; COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-=
HEIGHT: normal; mso-margin-top-alt: auto; mso-list: l3 level1 lfo6; ta=
b-stops: list 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Social=20
  Networking Integration</SPAN><SPAN=20
  style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'><o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"BACKGROUND: white; COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-=
HEIGHT: normal; mso-margin-top-alt: auto; mso-list: l3 level1 lfo6; ta=
b-stops: list 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Community-based=20
  early warning systems</SPAN><SPAN=20
  style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'><o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"BACKGROUND: white; COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-=
HEIGHT: normal; mso-margin-top-alt: auto; mso-list: l3 level1 lfo6; ta=
b-stops: list 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Building=20
  hazard-aware and ready communities</SPAN><SPAN=20
  style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'><o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"BACKGROUND: white; COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-=
HEIGHT: normal; mso-margin-top-alt: auto; mso-list: l3 level1 lfo6; ta=
b-stops: list 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Monitoring=20
  and evaluation of early warning system</SPAN><SPAN=20
  style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'><o:p></o:p></SPAN></LI></UL>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: bl=
ack; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-family:=
 "Times New Roman"'>&nbsp;</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>General=20
Notes</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>All=20
our courses can be Tailor-made to participants needs</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>The=20
participant must be conversant with English</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Presentations=20
are well guided, practical exercise, web based tutorials and group wor=
k. Our=20
facilitators are expert with more than 10years of experience.</SPAN><S=
PAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Upon=20
completion of training the participant will be issued with Foscore dev=
elopment=20
center certificate (FDC-K)</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Training=20
will be done at Foscore development center (FDC-K) center in Nairobi K=
enya. We=20
also offer more than five participants training at requested location =
within=20
Kenya, more than ten participant within east Africa and more than twen=
ty=20
participant all over the world.</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Course=20
duration is flexible and the contents can be modified to fit any numbe=
r of=20
days.</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>The=20
course fee includes facilitation training materials, 2 coffee breaks, =
buffet=20
lunch and a Certificate of successful completion of Training. Particip=
ants will=20
be responsible for their own travel expenses and arrangements, airport=
=20
transfers, visa application dinners, health/accident insurance and oth=
er=20
personal expenses.</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>For=20
any enquiry to:&nbsp;training@fdc-k.org&nbsp;or +254712260031</SPAN></=
B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: Symbol; COLOR: blue; mso-fare=
ast-font-family: "Times New Roman"; mso-bidi-font-family: "Times New R=
oman"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
blue; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Website:www.fdc-k.=
org</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><o:p><FONT=20
face=3DCalibri>&nbsp;</FONT></o:p></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><B=20
style=3D"mso-bidi-font-weight: normal"><U><SPAN=20
style=3D"TEXT-TRANSFORM: uppercase"><FONT face=3DCalibri>Other upcomin=
g workshops=20
March=20
2022(Nairobi,kenya|mombasa,kenya|rwanda,kigali|dubai)</FONT></SPAN></U=
></B></P>
<P class=3DMsoListParagraph=20
style=3D"MARGIN: auto 0cm auto 36pt; TEXT-INDENT: -18pt; mso-list: l2 =
level1 lfo7"><SPAN=20
style=3D"FONT-FAMILY: Symbol; mso-fareast-font-family: Symbol; mso-bid=
i-font-family: Symbol"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><A=20
href=3D"http://tracking.fdc-k.africa/tracking/click?d=3DtIMifx0Kva7EFH=
xO9xQkkphM9ssgvFs1uhgFBPkhKvf-h8kDb0UfGxXBSjRa5GaJElc00yEsKnd1pyXH3klz=
AXIZHpZEyvxyYLcmhFBHBVIPJzlJWaW1LodEn_1Rp_ZPo_g22j_iBZn9HtWhmjtrpkTTcW=
OobqCjNHqeH_LsY6dRVmYECPGFBBWmVB7QtKRsHFCRtDSLcz-j_bf33TmRugVB-IsaZBqj=
B456rjsHTcikQ-TyWUAUCJGq2HS5DqZU_dazsqrt_ZRluKwQG_5M_GU1">Qualitative=20
Data Management and Analysis with NVIVO Workshop<o:p></o:p></A></P>
<P class=3DMsoListParagraph=20
style=3D"MARGIN: auto 0cm auto 36pt; TEXT-INDENT: -18pt; mso-list: l2 =
level1 lfo7"><SPAN=20
style=3D"FONT-FAMILY: Symbol; mso-fareast-font-family: Symbol; mso-bid=
i-font-family: Symbol"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><A=20
href=3D"http://tracking.fdc-k.africa/tracking/click?d=3DwPeQvwHmmLoHCD=
hRA1AiLrSqcinm8dtWjpFto22rrqKHHlQVeJ5uiJDHM8H08iuZa8boqNKLs8LKJGbNdMXi=
BVtw_W6lvmaHonGkUjrxmFvtjjzZnDZ71odfIioBcqyuL4yfj-TEY0iaEYF53xxKkArMuN=
WyVX5c4vFLkAYBojQqd6Abxc5Xlvi5tL_egkUDamNyf3v3SmjiQuXrfgc4hxLMBmIDYLnE=
EfprELJiVSrksqt6DBaaP0GBc-eq64yqdw2">Gender=20
Equity Achievement in Development Projects Workshop<o:p></o:p></A></P>
<P class=3DMsoListParagraph=20
style=3D"MARGIN: auto 0cm auto 36pt; TEXT-INDENT: -18pt; mso-list: l2 =
level1 lfo7"><SPAN=20
style=3D"FONT-FAMILY: Symbol; mso-fareast-font-family: Symbol; mso-bid=
i-font-family: Symbol"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><A=20
href=3D"http://tracking.fdc-k.africa/tracking/click?d=3DmWWgbi0vXe6yPR=
vFz51jjH6WiJ5Kfnbt3C8ImSbM5pygAAdU7hRR1YOe3SC5TqFx11PFKGnOvmG2V1_XDPuv=
LAoonm-rxknuqOvV3CHkibAfwh7kTliJyxlOL17esd5FhtE4Mj7WdK7aQmiU-QWSAAjuy9=
ZmtjYHtwheL2xB5p69pAbFeZLUBYK8w1_rGdjJeiAphDDxBUMrKosZLXk8l0UStROpjDt3=
5X2bmLV7_XKRJ3o_qXfJEw4yWwMHjd2l2A2">Advanced=20
Excel Formulas and Functions Workshop<o:p></o:p></A></P>
<P class=3DMsoListParagraph=20
style=3D"MARGIN: auto 0cm auto 36pt; TEXT-INDENT: -18pt; mso-list: l2 =
level1 lfo7"><SPAN=20
style=3D"FONT-FAMILY: Symbol; mso-fareast-font-family: Symbol; mso-bid=
i-font-family: Symbol"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><A=20
href=3D"http://tracking.fdc-k.africa/tracking/click?d=3DFZZ3aPiKa1myz1=
TMyCycKD1YIkh0RjZBzkQsf2ll4PVnfRw3VyQLudKCoIUv9mcQ1rLpVtxksVEUSwTe56Dd=
So1Afwd6mlp7wJd_LYPfrD1a8D3bsjQGkDqX_cb0ohSdcv_jwJ-Tr79SHwF5xA2rgsKM2Y=
iojzd-waS0HRmPLGsq5hy2Z7Yo_L-pdYFjBKyH0kNPjMFZgdmAclOG409oUbHqTlXZPe_z=
gvkiypHvluAQmeMvyKITgx2ziqVxFAZIgQ2">Transformational=20
Leadership and Governance Workshop <o:p></o:p></A></P>
<P class=3DMsoListParagraph=20
style=3D"MARGIN: auto 0cm auto 36pt; TEXT-INDENT: -18pt; mso-list: l2 =
level1 lfo7"><SPAN=20
style=3D"FONT-FAMILY: Symbol; mso-fareast-font-family: Symbol; mso-bid=
i-font-family: Symbol"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><A=20
href=3D"http://tracking.fdc-k.africa/tracking/click?d=3Dc3PGsqiQbbESSb=
MsNwcCligorzJ2C3qjfNhs_625EEnBitysVql4Jb3Llz8ackfiV7ytWR-3qnOKYmfsNjeb=
V-LFDivK_hbX3S5Pg8bjDrphjF0T1gh3thNJFEstqO0njzitCrvZiG_y1bkGCeybSsxztC=
tTi4uW2PuEC6TJMKgGpEJgj2ckVM0uxHR2J0qNl_FYvkn0NM2UsXNBlCl5BJhwho9kIiV-=
znPAm5OHKvqitUVttXBQr31dmaf5YYcoLtdhMDe6zGVapZ4JIS8QFFn2ulx_kjVVg_ZH0_=
Z3n9-J0">Project=20
Information Management System for Development Organizations and NGOs=20
Workshop<o:p></o:p></A></P>
<P class=3DMsoListParagraph=20
style=3D"MARGIN: auto 0cm auto 36pt; TEXT-INDENT: -18pt; mso-list: l2 =
level1 lfo7"><SPAN=20
style=3D"FONT-FAMILY: Symbol; mso-fareast-font-family: Symbol; mso-bid=
i-font-family: Symbol"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><A=20
href=3D"http://tracking.fdc-k.africa/tracking/click?d=3DH0J4oi_ev6a97x=
OQ5Y-4mK4Yu55YW4VLhFjyzsuXclfR0uZZAEJkrq2g3QodoOm3h6pb1okIKrrkfkKNsAE7=
cl3_kGBZF4W12-FgypLASq8i5dxQKMjATxJ1rZ3FOYWl-jZQ7To83qGZeIaeOAy988JI3d=
csaacDQMdfFBwDo9N99jw5SHmE1dMM4vQ-QmhFrgZctrcqSE1i5sC6cLJl8P7uWLsOULIp=
r9OHsbTyavKrvbI8Cz2oosYaUNzCrylLpQ2">Human=20
Resources Management, Development and Auditing Workshop<o:p></o:p></A>=
</P>
<P class=3DMsoListParagraph=20
style=3D"MARGIN: auto 0cm auto 36pt; TEXT-INDENT: -18pt; mso-list: l2 =
level1 lfo7"><SPAN=20
style=3D"FONT-FAMILY: Symbol; mso-fareast-font-family: Symbol; mso-bid=
i-font-family: Symbol"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><A=20
href=3D"http://tracking.fdc-k.africa/tracking/click?d=3Dt8bLBao3SFwllx=
af1Auvw35xhifF3df54dIEBPKCL_iGiCjjPnZm_I8g00tcNeG8SN0xigbFv1KhjPyMnQDf=
8D-R-6QDCW26BPFHyMrW8ugdtug3THt5dib4753PdXw1Sf9j3gP2ZotHh8EZ3vHx1FPcH9=
eUHKu2nw332csv7WsKsAonQFDxt6pyxrwwauQU9p0GFEVYSLZ6FzT-xYomvG9RWDsBJX6v=
Y30hFEJOOu4b0">GIS=20
Application in Disaster Risk Reduction Workshop<o:p></o:p></A></P>
<P class=3DMsoListParagraph=20
style=3D"MARGIN: auto 0cm auto 36pt; TEXT-INDENT: -18pt; mso-list: l2 =
level1 lfo7"><SPAN=20
style=3D"FONT-FAMILY: Symbol; mso-fareast-font-family: Symbol; mso-bid=
i-font-family: Symbol"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><A=20
href=3D"http://tracking.fdc-k.africa/tracking/click?d=3DnOc8Q6-GnKVUIp=
gRPHvuCLjOnOA5sYtPFl7i9-F3bH7kLtLYdzwBA39ppa4kjhAlQzhNyciMW8eBSRIa54Sv=
2xnVyCjNNCJZHYcPyMH_riT3N8qpHyCl3KYrqtEzPHk8v_EHqQ-v7DgdBBWEPeRPcQaZ40=
YbG0SuPtz7ZLzZrynuzbvE8NoaFEzUrjhoiY9wJ_fS3dHOtm-sUviQCqFJlQ1KYPWcCV7N=
Gouz4542ilgQsWQ7nue7lZkzH8NQvd69VWwvYxizm2dJekF4ohn76gc1">Data=20
Analysis, Modeling and Simulation using Excel Workshop <o:p></o:p></A>=
</P>
<P class=3DMsoListParagraph=20
style=3D"MARGIN: auto 0cm auto 36pt; TEXT-INDENT: -18pt; mso-list: l2 =
level1 lfo7"><SPAN=20
style=3D"FONT-FAMILY: Symbol; mso-fareast-font-family: Symbol; mso-bid=
i-font-family: Symbol"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><A=20
href=3D"http://tracking.fdc-k.africa/tracking/click?d=3D5ymmgILBioohUW=
xkmP_PF0B91Iwg4tdckrdjEVzfBg4UbABgIfBOote3PjEcaNPWgucEFnZwZZwIev56pjtX=
rfZt5VvrnoNdBCsvwmquDr3LEJV9dc1bykXfdh-30BXywomWCwbgTw51NCUe4yVCdJjtPL=
136XjcqhaE4GLVxN-Wzz55Tgl6VQXtZ7fTVYJaqSqx6isyzK1jAK6Rb_ZSclY5es7FmZkG=
FMBqx0H5fBvWiMthD64Dvel_CbAOkBtkBQ2">Quantitative=20
Data Management and Analysis with STATA Workshop<o:p></o:p></A></P>
<P class=3DMsoListParagraph=20
style=3D"MARGIN: auto 0cm auto 36pt; TEXT-INDENT: -18pt; mso-list: l2 =
level1 lfo7"><SPAN=20
style=3D"FONT-FAMILY: Symbol; mso-fareast-font-family: Symbol; mso-bid=
i-font-family: Symbol"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><A=20
href=3D"http://tracking.fdc-k.africa/tracking/click?d=3DrW7kv9ae3RIZGN=
LEJPAmbGoIzbaxWOgeKodQ2pqAUJTYkaJsrly_YJD250qhzxXTsXFhMRUnEJl5KI2aJ2UY=
3JAtnbzJS7AtVN5Crwwra7H2pcjUiaopq9sFVdhp8LkhBM5gdAW-j5Pj8Eo5i_IxFCewkr=
kjVevk7GCAUR1-UOFyK8D6tq6kqYj_DO0NQTnC836t3KIPFYdm8GnkgXbE8Q8fQK56K1sh=
uy6vLZ9x_7BkSccJUJTc9zLSWwunRfgBlg2">Developing=20
organization Balanced Scorecard Workshop<o:p></o:p></A></P>
<P class=3DMsoListParagraph=20
style=3D"MARGIN: auto 0cm auto 36pt; TEXT-INDENT: -18pt; mso-list: l2 =
level1 lfo7"><SPAN=20
style=3D"FONT-FAMILY: Symbol; mso-fareast-font-family: Symbol; mso-bid=
i-font-family: Symbol"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><A=20
href=3D"http://tracking.fdc-k.africa/tracking/click?d=3Dt8bLBao3SFwllx=
af1Auvw35xhifF3df54dIEBPKCL_iGiCjjPnZm_I8g00tcNeG8SN0xigbFv1KhjPyMnQDf=
8D-R-6QDCW26BPFHyMrW8ugdtug3THt5dib4753PdXw1Sf9j3gP2ZotHh8EZ3vHx1Jy3TO=
U3TCCd80wlrUziwg19jCmiGbhCAuq9gFWDv1UQUD2lVda0PwMjjCyEygqhpqp0RiL4mdhK=
ZyY7JoKWrIEs0">Public=20
Health in WASH during Emergencies Workshop<o:p></o:p></A></P>
<P class=3DMsoListParagraph=20
style=3D"MARGIN: auto 0cm auto 36pt; TEXT-INDENT: -18pt; mso-list: l2 =
level1 lfo7"><SPAN=20
style=3D"FONT-FAMILY: Symbol; mso-fareast-font-family: Symbol; mso-bid=
i-font-family: Symbol"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><A=20
href=3D"http://tracking.fdc-k.africa/tracking/click?d=3DOH4B-n934LNici=
dul_h8WBme-KBpSpjIzNeDjee2HAUl0SdkXQJ6iRBRRdERaQWneCirrs7ZF-e40qZe75fe=
-NbI6QQoccYGIsi_PEtgLc3fuCl6J42ZZc9qF_ikHFHmmCFvTmlMnmNMPxafb_uhJyQhKq=
TE4xAnGn_0ivY41TZzYrLi5_p0Nxj3bpn1hnbUhKPqecEIIiR6Tgob3pPrYz2okY0y1fY9=
2BOAgFSMpevuNJw3PFiizz1uDcoLdwmiuw2">Mobile=20
Data Collection using ODK &amp; KoboToolBox Workshop <o:p></o:p></A></=
P>
<P class=3DMsoListParagraph=20
style=3D"MARGIN: auto 0cm auto 36pt; TEXT-INDENT: -18pt; mso-list: l2 =
level1 lfo7"><SPAN=20
style=3D"FONT-FAMILY: Symbol; mso-fareast-font-family: Symbol; mso-bid=
i-font-family: Symbol"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><A=20
href=3D"http://tracking.fdc-k.africa/tracking/click?d=3Dn5QsPhcSIVEuV6=
nPXhu9Q-nWP_px-NrQp_LjvHZjdb7RkNx3g26eFayB9GohfMvoYHgFS8qgK29UE0AuPgfv=
623bOxLZ74RXoo9YdZQ-R0DjDnLJb7lJX3HUPAi-AorWN-T6E4AxJ9VcBqnwQywpaqUtml=
dhYt0zMWDU2OjfWn3Idb2CVv_Q8msm8wArQ2gRdvog-k_XA8H_hlXUIjEO2dTJwyM6iQwa=
70geTG9p-RkW-aJl9Gl-QFfUOGv6oHOpfii5zip0w4es3yJF-tGW-zA1">Transforming=
,=20
analyzing &amp; visualizing data with Microsoft Power BI=20
Workshop<o:p></o:p></A></P>
<P class=3DMsoListParagraph=20
style=3D"MARGIN: auto 0cm auto 36pt; TEXT-INDENT: -18pt; mso-list: l2 =
level1 lfo7"><SPAN=20
style=3D"FONT-FAMILY: Symbol; mso-fareast-font-family: Symbol; mso-bid=
i-font-family: Symbol"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><A=20
href=3D"http://tracking.fdc-k.africa/tracking/click?d=3DH0J4oi_ev6a97x=
OQ5Y-4mK4Yu55YW4VLhFjyzsuXcldfJnq1cauXhSALNxLufGRfqTjPWGCt_wsW8rOfZz5P=
TpA-fw5prjx4zz6THKRBG-Y0eydH3TXeVuNFCPgEQa6uyaukM8ZPwg0CnR9zQcV-YjHctz=
d14Hp03_FOcomXWfDiYuBQpQfxh7SNGYHRrwTIStIh7sG45AuxLJOAncbXGvVYU-2DLssC=
VyDtpOSVUbGgSTzIE_-LB65mfyBQfw8tlQ2">Quantitative=20
Data Management and Analysis with R Workshop<o:p></o:p></A></P>
<P class=3DMsoListParagraph=20
style=3D"MARGIN: auto 0cm auto 36pt; TEXT-INDENT: -18pt; mso-list: l2 =
level1 lfo7"><SPAN=20
style=3D"FONT-FAMILY: Symbol; mso-fareast-font-family: Symbol; mso-bid=
i-font-family: Symbol"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><A=20
href=3D"http://tracking.fdc-k.africa/tracking/click?d=3DPLHBK13ZiUz4wM=
GdvTQFAUfuVFzOdD1g1elGnI5dZIhLf619gSfO1mRWEre1UPZ2T4GzSEUZoNHmLh6A_f0t=
YXvb2sDNjFktxPNnpL2xXBN_9AemsS9hJE4WOwIUeYwGpivaKheUlGoX2pRJll3P5nER9N=
WhxRhJM6RRRhEHIUT8MPFGEmJj1zQEigb7ieW24kyhGHunOY9DWYigf-sffFoe0aOKWcvd=
fVQEV6JJuFKpeoGNhMOocG4RGgdjtMpbWjmxwZbrlVE0SvnVytyO0y01">Quantitative=
=20
Data Management and Analysis with SPSS Workshop<o:p></o:p></A></P>
<P class=3DMsoListParagraph=20
style=3D"MARGIN: auto 0cm auto 36pt; TEXT-INDENT: -18pt; mso-list: l2 =
level1 lfo7"><SPAN=20
style=3D"FONT-FAMILY: Symbol; mso-fareast-font-family: Symbol; mso-bid=
i-font-family: Symbol"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><A=20
href=3D"http://tracking.fdc-k.africa/tracking/click?d=3DCx2ZrnJt4yTljR=
F3LlbR1H-U8CsOEjhGzTgVjA1AzzLH318ZXLkWez7Co7LJpKf534cBB4PEVGpmkERC5UAi=
Eibxz52_UBLE7BegC_XfWiqqQQfj-duDKxglSLg0WkfthLiRkmboJlJ7ddfgdyuJWDiRQC=
G6TrKH1mDUYXjie2rXEYmIKrWXxUJ_NUpyAAeJ0R8YKCaqS_nTip9NWnqQMLH9bV-SxNVe=
Sef_Ob5NFnj7y1pRJKOZUyyFURb3riYOaSkYoDlB75RGcOJNJiyzwgi2O6-bvBBrlo37ub=
bab2ss0">Strategic=20
Communication Training For Managers And Executives Program=20
Workshop<o:p></o:p></A></P>
<P class=3DMsoListParagraph=20
style=3D"MARGIN: auto 0cm auto 36pt; TEXT-INDENT: -18pt; mso-list: l2 =
level1 lfo7"><SPAN=20
style=3D"FONT-FAMILY: Symbol; mso-fareast-font-family: Symbol; mso-bid=
i-font-family: Symbol"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><A=20
href=3D"http://tracking.fdc-k.africa/tracking/click?d=3DpUURyvNiirv2cW=
4yWUEurFQMqbD1_vCkZzl81lC3msGMhjJtue0McZxf2JTmjAZG-H967as2loCAX-rOnDMe=
2TmMwdvtV4wxyySjmyDAWGSwrbGrNoA4ZSqNVqNocMnBEdiDVw8EhBECC7rdh82MiZjSuQ=
FiQXiim0GvvaEHzvkqW7sPNdtRPg_Nxx3yjNJP2iqf8LBl51obmts3QyZBv8yDxVz7teOk=
Nij26dqbV4LRUsUxKRduoJ49mEinMmLt1A2">Grant=20
Management using Sun Accounting System Workshop<o:p></o:p></A></P>
<P class=3DMsoListParagraph=20
style=3D"MARGIN: auto 0cm auto 36pt; TEXT-INDENT: -18pt; mso-list: l2 =
level1 lfo7"><SPAN=20
style=3D"FONT-FAMILY: Symbol; mso-fareast-font-family: Symbol; mso-bid=
i-font-family: Symbol"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><A=20
 href=3D"http://tracking.fdc-k.africa/tracking/click?d=3Dl2HoI7v5Q4GUl=
3zv2--ZKIIku3PDQNfzWdolrYyae_qIK7ldO2CiEMn89cvxdV8MABgnYrjq39or2LCDTL2=
epCQKHHeVGgP9cz9qz8xuMkCnDOjHJFtrTWlwKVbfm40T77Xs9_3RDTjMXl091O1mqG4w2=
g8BV0RQGGnIcs-4bm6zaJca4XrMPYYk7elmmaICq7qmwkD7-x_-3KI88s2XWB6Agl5Z_J6=
6yqTdz49NFNtDYeD8nQT6R-bW5613R3XcQg2" >Research=20
Design, ODK Mobile Data Collection, GIS Mapping, Data Analysis using N=
VIVO and=20
SPSS Workshop</A></P>
<P class=3DMsoListParagraph=20
style=3D"MARGIN: auto 0cm auto 36pt; TEXT-INDENT: -18pt; mso-list: l2 =
level1 lfo7">&nbsp;</P>
<P class=3DMsoListParagraph=20
style=3D"MARGIN: auto 0cm auto 36pt; TEXT-INDENT: -18pt; mso-list: l2 =
level1 lfo7">Regards</P>
<P class=3DMsoListParagraph=20
style=3D"MARGIN: auto 0cm auto 36pt; TEXT-INDENT: -18pt; mso-list: l2 =
level1 lfo7">FDC=20
Training Team</P>
<P class=3DMsoListParagraph=20
style=3D"MARGIN: auto 0cm auto 36pt; TEXT-INDENT: -18pt; mso-list: l2 =
level1 lfo7"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><STRONG>For=20
any inquiry to:&nbsp;training@fdc-k.org&nbsp;or +254712260031 or </STR=
ONG><A=20
href=3D"http://tracking.fdc-k.africa/tracking/click?d=3DEjx10kmXP299MP=
_ue0qsVTTHF5eeJsCMS8azH2_mTHIRRBUQ5HCTrb3CUpjzYrojOJImdppedABwa8g_c-GJ=
ZXUyQszomo-QEmR_M131YnXDr6zccrkPmA7bLZtCNY6QQHKMVdv71OyjJ8-mhkez82U1">=
<STRONG>Contact us</STRONG></A></SPAN></P>
<P class=3DMsoListParagraph=20
style=3D"MARGIN: auto 0cm auto 36pt; TEXT-INDENT: -18pt; mso-list: l2 =
level1 lfo7">&nbsp;</P></BODY></HTML>

<img src=3D"http://tracking.fdc-k.africa/tracking/open?msgid=3D4kf7cGp=
dTydUMlmmjaNaaQ2&c=3D1488825403228479835" style=3D"width:1px;height:1p=
x" alt=3D"" /><div style=3D"text-align:center; background-color:#fff;p=
adding-top:10px;padding-bottom:10px;font-size:8pt;font-family:sans-ser=
if;"><a href=3D"http://tracking.fdc-k.africa/tracking/unsubscribe?d=3D=
nKqnoPD4YYC9a-FlwJEmV3CS7-_cPlIpqfj791_Pb-W2JeOb1He-j-WNOZRg56zP3136nq=
M_sWVeMtIsY_jSwWrY1s_xRJqgUlPKAK27dppxpbDQgKnqFk3WeNiw0IzPoA2" style=3D=
"text-align:center;text-decoration:none;color:#666;">UNSUBSCRIBE</a></=
div>
--=-eZCfUGnTqSbrN8Oqc80aRCXM3w5j+/8k/XWKzQ==--

--===============1466610905052664556==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============1466610905052664556==--
