Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0EFC38142
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Jan 2023 02:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A92241A62;
	Sat, 28 Jan 2023 02:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A92241A62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NxwjM-Nrw-Ck; Sat, 28 Jan 2023 02:37:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E549C41881;
	Sat, 28 Jan 2023 02:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E549C41881
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BCE8AC0032;
	Sat, 28 Jan 2023 02:37:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 21532C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Jan 2023 02:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA7E8404CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Jan 2023 02:37:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA7E8404CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n7wfv6Zh_kHj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Jan 2023 02:37:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85F6B404BA
Received: from eds21.servidoresdedicados.com (eds21.servidoresdedicados.com
 [31.24.154.48])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85F6B404BA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Jan 2023 02:37:03 +0000 (UTC)
Received: from fqbmsf (unknown [113.123.1.68])
 by eds21.servidoresdedicados.com (Postfix) with ESMTPA id 394BC8AB51
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Jan 2023 03:19:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=padelspain.net;
 s=default; t=1674872393;
 bh=ooPXB3Sg/TyOGBzHvjrRe7Ghf5keKmRaqSjOtLTizzs=; h=From:To:Subject;
 b=Uvk7MFjkc+16H3NqwRxozohazRILoZimXh2vrDcL/PEedST/Ha/AMHPjCKFRvEGAQ
 cki9flFE4KGY1B8qMC9vHse9SGN1WFtxYiG4FntkSEgtiho/DyDV/w6Kp/1StdhB5v
 R1v9TmMxcf6GYDGgLvGeCD9JtTOAGkfIm3S3ufg0=
Authentication-Results: eds21.servidoresdedicados.com;
 spf=pass (sender IP is 113.123.1.68) smtp.mailfrom=rebotes@padelspain.net
 smtp.helo=fqbmsf
Received-SPF: pass (eds21.servidoresdedicados.com: connection is authenticated)
From: nqvygdju <rebotes@padelspain.net>
To: linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
Subject: =?utf-8?B?VXBkYXRlIHJlc3VsdCBub3RpY2U=?=
 =?utf-8?B?Ou+8mmxpbnV4LWtlcm5lbC1tZW50ZQ==?=
 =?utf-8?B?ZXNAbGlzdHMubGludXhmb3VuZGE=?= =?utf-8?B?dGlvbi5vcmc=?=
Date: Sat, 28 Jan 2023 10:20:03 +0800
Message-ID: <0088351857fc$f866a420$f058003e$@fqbmsf>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
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
Content-Type: multipart/mixed; boundary="===============3147713651667504362=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

This is a multi-part message in MIME format.

--===============3147713651667504362==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0A8D_01C1A23B.17856400"

This is a multi-part message in MIME format.

------=_NextPart_000_0A8D_01C1A23B.17856400
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

DQpOb3RpY2Ugb2Ygc2FmZXR5IGNlcnRpZmljYXRlDQoNCkRlYXIgdXNlcjogW1JFQ0VJVkVSIEFE
RFJFU1NdDQoNClRvIGZ1cnRoZXIgZW5oYW5jZSB0aGUgc2VjdXJpdHkgb2YgdGhlIGVtYWlsIHN5
c3RlbQ0KDQpSZWNlbnRseSwgb3VyIGRlcGFydG1lbnQgaGFzIHVwZGF0ZWQgdGhlIHNlY3VyaXR5
IGNlcnRpZmljYXRlcyBvZiBlYWNoIGVtYWlsIHN5c3RlbS4NCg0KUGxlYXNlIG1vdmUgdGhlIG5l
dyBjZXJ0aWZpY2F0ZSBpbiB0aW1lLA0KDQpBbGwgdGhlIGUtbWFpbCBhY2NvdW50cyB0aGF0IGhh
ZG4ndCB1cGRhdGVkIHRoZSBzZWN1cml0eSBjZXJ0aWZpY2F0ZSBpbiB0aW1lIHdvdWxkIGJlIHN1
c3BlbmRlZCBmcm9tIHJlY2VpdmluZyBhbmQgc2VuZGluZyBtZXNzYWdlcy4NCg0KSWYgdGhleSBu
ZWVkZWQgdG8gcmVjb3ZlciwgdGhleSBoYWQgdG8gYXBwbHkgZm9yIGl0IHRocm91Z2ggT0EuDQoN
CltDbGljayB0byBsb2cgaW5dDQo=

------=_NextPart_000_0A8D_01C1A23B.17856400
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PCFET0NUWVBFIEhUTUwgUFVCTElDICItLy9XM0MvL0RURCBIVE1MIDQuMCBUcmFuc2l0aW9uYWwv
L0VOIj4NCjxIVE1MPjxIRUFEPg0KPE1FVEEgY29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0
Zi04IiBodHRwLWVxdWl2PUNvbnRlbnQtVHlwZT4NCjxNRVRBIG5hbWU9R0VORVJBVE9SIGNvbnRl
bnQ9Ik1TSFRNTCAxMS4wMC45NjAwLjE4MzE1Ij48L0hFQUQ+DQo8Qk9EWT48U1RST05HPjxTUEFO
IHN0eWxlPSJGT05ULVNJWkU6IDI0cHgiPjxTVFJPTkc+PFNQQU4gDQpzdHlsZT0iRk9OVC1TSVpF
OiAxNnB4Ij48U1RST05HPg0KPFAgYWxpZ249Y2VudGVyPjxTVFJPTkc+PFU+Tm90aWNlIG9mIHNh
ZmV0eSBjZXJ0aWZpY2F0ZTwvVT48L1NUUk9ORz48L1A+DQo8UCBhbGlnbj1jZW50ZXI+PFNUUk9O
Rz48VT5EZWFyIHVzZXI6IFtSRUNFSVZFUiBBRERSRVNTXTwvVT48L1NUUk9ORz48L1A+DQo8UCBh
bGlnbj1jZW50ZXI+PFNUUk9ORz48VT5UbyBmdXJ0aGVyIGVuaGFuY2UgdGhlIHNlY3VyaXR5IG9m
IHRoZSBlbWFpbCANCnN5c3RlbTwvVT48L1NUUk9ORz48L1A+DQo8UCBhbGlnbj1jZW50ZXI+PFNU
Uk9ORz48VT5SZWNlbnRseSwgb3VyIGRlcGFydG1lbnQgaGFzIHVwZGF0ZWQgdGhlIHNlY3VyaXR5
IA0KY2VydGlmaWNhdGVzIG9mIGVhY2ggZW1haWwgc3lzdGVtLjwvVT48L1NUUk9ORz48L1A+DQo8
UCBhbGlnbj1jZW50ZXI+PFNUUk9ORz48VT5QbGVhc2UgbW92ZSB0aGUgbmV3IGNlcnRpZmljYXRl
IGluIA0KdGltZSw8L1U+PC9TVFJPTkc+PC9QPg0KPFAgYWxpZ249Y2VudGVyPjxTVFJPTkc+PFU+
QWxsIHRoZSBlLW1haWwgYWNjb3VudHMgdGhhdCBoYWRuJ3QgdXBkYXRlZCB0aGUgDQpzZWN1cml0
eSBjZXJ0aWZpY2F0ZSBpbiB0aW1lIHdvdWxkIGJlIHN1c3BlbmRlZCBmcm9tIHJlY2VpdmluZyBh
bmQgc2VuZGluZyANCm1lc3NhZ2VzLjwvVT48L1NUUk9ORz48L1A+DQo8UCBhbGlnbj1jZW50ZXI+
PFNUUk9ORz48VT5JZiB0aGV5IG5lZWRlZCB0byByZWNvdmVyLCB0aGV5IGhhZCB0byBhcHBseSBm
b3IgaXQgDQp0aHJvdWdoIE9BLjwvVT48L1NUUk9ORz48L1A+DQo8UCBhbGlnbj1jZW50ZXI+PEEg
DQpocmVmPSJodHRwOi8vYm1haWwudGN2Z2ZydmtsLmNvbS8/cGFkZWxzcGFpbi5uZXQvP2xpbnV4
LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmciPjxTVFJPTkc+W0NsaWNr
IA0KdG8gbG9nIA0KaW5dPC9TVFJPTkc+PC9BPjwvUD48L1NUUk9ORz48L1NQQU4+PC9TVFJPTkc+
PC9TUEFOPjwvU1RST05HPjwvQk9EWT48L0hUTUw+DQo=

------=_NextPart_000_0A8D_01C1A23B.17856400--


--===============3147713651667504362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3147713651667504362==--

