Return-Path: <SRS0=C2G1=J4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD33C433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 May 2021 13:10:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 797BE61462
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 May 2021 13:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 797BE61462
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anirudhrb.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AFF14028A;
	Sat,  1 May 2021 13:10:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cExoXgToXl6Y; Sat,  1 May 2021 13:10:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6744B40264;
	Sat,  1 May 2021 13:10:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E9BCC000E;
	Sat,  1 May 2021 13:10:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41E4BC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 May 2021 13:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30E3884EC5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 May 2021 13:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=anirudhrb.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qFTu2hgsdXk4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 May 2021 13:10:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com
 [136.143.188.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 518E884E60
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 May 2021 13:10:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1619874614; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=G0fLoottJfClpiGHND3lXJB5oSzfIOTtRAieLbHQHVU8pRdjNRMzsv8CDo2HnN0JKdh2HgTEbe2DaIwiF/PJDYRx1qminEUh/4h81vU9IwF+POaBdrv6Z6ANLbB85GMLENg1QmdLTlkimw/EUxGMDNafTope5Qgq2Fz6kLnA3LI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1619874614;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=aeVb9tMtN8VP+qEMHO0j4WwukXcb48yCZRdEb9bMQYU=; 
 b=eb8SDlX02QzYFdxZCQ7HxT1BXAA912qnTO7kS/0fihv4lzIXMpFGhhpjmqWqtcOeHrW12H2MqMy+Jccmx1uYRLQF3Jv5Szhz84dy7ZOKoY/tWT6lgPoY9EGQdcZFCFTQg7uazv4decjcygLumf0mfQOolR9Yd/uBYB/UCkcGjhY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=anirudhrb.com;
 spf=pass  smtp.mailfrom=mail@anirudhrb.com;
 dmarc=pass header.from=<mail@anirudhrb.com> header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1619874614; 
 s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To;
 bh=aeVb9tMtN8VP+qEMHO0j4WwukXcb48yCZRdEb9bMQYU=;
 b=oyoMkL+eiS8SxK/h+JHxBeyZF4UM/bPruSmjD+vR7sO8TIhpgLl/sLO4PBQWmHkz
 chlSSTPWM4S45ENS+6Tc9+cODRrHG5oigHYokwci2jj2n3mZf64yElnPjUdrfThhV35
 fIQ4vjAP/a1bmbyNyV4FP13AIdqCU1HI94QNRpUU=
Received: from anirudhrb.com (49.207.211.62 [49.207.211.62]) by mx.zohomail.com
 with SMTPS id 1619874611701231.35758212814903;
 Sat, 1 May 2021 06:10:11 -0700 (PDT)
Date: Sat, 1 May 2021 18:40:04 +0530
From: Anirudh Rayabharam <mail@anirudhrb.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] rapidio: remove unused variable in rio_cm.c
Message-ID: <YI1TLAOXoQozBa1M@anirudhrb.com>
References: <20210501055018.9244-1-mail@anirudhrb.com>
 <YI0sIoDv6H+aSyNE@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YI0sIoDv6H+aSyNE@kroah.com>
X-ZohoMailClient: External
Cc: Alexandre Bounine <alex.bou9@gmail.com>,
 Matt Porter <mporter@kernel.crashing.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

T24gU2F0LCBNYXkgMDEsIDIwMjEgYXQgMTI6MjM6MzBQTSArMDIwMCwgR3JlZyBLSCB3cm90ZToK
PiBPbiBTYXQsIE1heSAwMSwgMjAyMSBhdCAxMToyMDoxN0FNICswNTMwLCBBbmlydWRoIFJheWFi
aGFyYW0gd3JvdGU6Cj4gPiBSZW1vdmUgdW51c2VkIHZhcmlhYmxlICdyYycgdG8gZml4IGdjYyB3
YXJuaW5nOgo+ID4gCj4gPiAJZHJpdmVycy9yYXBpZGlvL3Jpb19jbS5jOiBJbiBmdW5jdGlvbiDi
gJhyaW9fdHhjcV9oYW5kbGVy4oCZOgo+ID4gCWRyaXZlcnMvcmFwaWRpby9yaW9fY20uYzo2NzM6
Nzogd2FybmluZzogdmFyaWFibGUg4oCYcmPigJkgc2V0IGJ1dAo+ID4gCW5vdCB1c2VkIFstV3Vu
dXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmlydWRoIFJh
eWFiaGFyYW0gPG1haWxAYW5pcnVkaHJiLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvcmFwaWRp
by9yaW9fY20uYyB8IDMgKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAy
IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yYXBpZGlvL3Jpb19j
bS5jIGIvZHJpdmVycy9yYXBpZGlvL3Jpb19jbS5jCj4gPiBpbmRleCA1MGVjNTNkNjdhNGMuLjU0
NTY5M2JkODZhMyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvcmFwaWRpby9yaW9fY20uYwo+ID4g
KysrIGIvZHJpdmVycy9yYXBpZGlvL3Jpb19jbS5jCj4gPiBAQCAtNjcwLDEyICs2NzAsMTEgQEAg
c3RhdGljIHZvaWQgcmlvX3R4Y3FfaGFuZGxlcihzdHJ1Y3QgY21fZGV2ICpjbSwgaW50IHNsb3Qp
Cj4gPiAgCSAqLwo+ID4gIAlpZiAoIWxpc3RfZW1wdHkoJmNtLT50eF9yZXFzKSAmJiAoY20tPnR4
X2NudCA8IFJJT0NNX1RYX1JJTkdfU0laRSkpIHsKPiA+ICAJCXN0cnVjdCB0eF9yZXEgKnJlcSwg
Kl9yZXE7Cj4gPiAtCQlpbnQgcmM7Cj4gPiAgCj4gPiAgCQlsaXN0X2Zvcl9lYWNoX2VudHJ5X3Nh
ZmUocmVxLCBfcmVxLCAmY20tPnR4X3JlcXMsIG5vZGUpIHsKPiA+ICAJCQlsaXN0X2RlbCgmcmVx
LT5ub2RlKTsKPiA+ICAJCQljbS0+dHhfYnVmW2NtLT50eF9zbG90XSA9IHJlcS0+YnVmZmVyOwo+
ID4gLQkJCXJjID0gcmlvX2FkZF9vdXRiX21lc3NhZ2UoY20tPm1wb3J0LCByZXEtPnJkZXYsIGNt
Ym94LAo+ID4gKwkJCXJpb19hZGRfb3V0Yl9tZXNzYWdlKGNtLT5tcG9ydCwgcmVxLT5yZGV2LCBj
bWJveCwKPiA+ICAJCQkJCQkgIHJlcS0+YnVmZmVyLCByZXEtPmxlbik7Cj4gCj4gV2h5IG5vdCBo
YW5kbGUgdGhlIHBvdGVudGlhbCBlcnJvciBzZW50IGhlcmU/CgpJIGRvbid0IGtub3cgaG93IGl0
IHNob3VsZCBiZSBoYW5kbGVkICh0aGVzZSBmdW5jdGlvbnMgZG9uJ3QgcmV0dXJuIGFueXRoaW5n
KS4KSSBhc3N1bWVkIHRoYXQgc2luY2UgaXQgaXMgbm90IGN1cnJlbnRseSBiZWluZyBoYW5kbGVk
LCBpdCdzIHByb2JhYmx5IG5vdAp1c2VmdWwuCgpJJ2xsIGxvb2sgaW50byBpdCB0aG91Z2guIEkg
Z3Vlc3Mgd2UgY291bGQgc2ltcGx5IGxvZyBpdCBhdCB0aGUgdmVyeSBsZWFzdC4KClRoYW5rcyEK
CgktIEFuaXJ1ZGguCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVl
c0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9u
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
