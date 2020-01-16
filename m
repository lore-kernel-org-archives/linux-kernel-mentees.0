Return-Path: <SRS0=fgSf=3F=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D3B6C33CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jan 2020 11:36:53 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BABA20730
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jan 2020 11:36:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qHQli6cr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BABA20730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 074B886149;
	Thu, 16 Jan 2020 11:36:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qiZMxY1I8x0o; Thu, 16 Jan 2020 11:36:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E8D248480D;
	Thu, 16 Jan 2020 11:36:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E46E1C1D82;
	Thu, 16 Jan 2020 11:36:48 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2649FC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 11:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 222DA20461
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 11:36:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yovyAFmrIb-3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 11:36:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 751E41FE2F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 11:36:42 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id a33so9761092pgm.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 03:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=eQRtO2wkjYCGFOmpMMH6bMmS+AdmojAUYypFQRrfub0=;
 b=qHQli6crr3V62Kxs+XudI9Qk/1uYi6hkBdVnfMK2oQFjagHU70j6KPR/l/u/Dt4WFg
 ifTP8dyAbsZBv+Z9PAUw84TEZ2TpE9D/tIlmD///JOpZyucRBQXKCUslK4ZCHVskrvYg
 r/2PyZIxZwghPtSkoWQtxUiG8MZg1mEvzTCkW2PXHTVT4Jcmo3VlRWY6C03QFK8hBZ42
 UPajuhgZyKHEHaCzLWKP9PmdDOAkFmJ3JrQrK+theD2KNwr+LATooa787kUNOR5AaEJf
 JAr0OKcSI7S/I+tuZTsoWxlpfvJowYXuZc1RpeMftENGG0bbazE61/p4M70HLvws3/H6
 JMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=eQRtO2wkjYCGFOmpMMH6bMmS+AdmojAUYypFQRrfub0=;
 b=a50Jn6yQxYQytVtFPGeDWAAm5fQnI2C8diy29XFV0wejRO45GJcx8HEcTQRZFwoQST
 vojy5pUDmsp0g30EJHte7MqZyk9KNtj6v1I2Wxhe8Z77lsqAWgzsMvLT0WFbG0RZ7Vc6
 wWmZiSyHeU8bOlLNRPBocO/THq520fCDi7uRFADchGzLUUvw3wzatBBQUQyvE/hon7r3
 c6somnw1TEsbhIM29GcqLh/p9xVrZsiek/OT7kDfVierE2fDoPBPj1odM28l/e36RVBo
 rEy0lVfeoZPTTlLFbr1UhloR/VGPq17bL4pFqewdfA1+3eUKavnvod7UoKHic5zF8Ah3
 dTZA==
X-Gm-Message-State: APjAAAXfTrSjt28KsSevS0yysh2C2b6BNSE4ledvJj1ooMZ0HWSFgASf
 YSEQR8OpUFtrueJ1zdegoU4=
X-Google-Smtp-Source: APXvYqx7CVHMtJW7WUx5mKy6gViOP1xHfDAmrWMqJB7l0mQrs3d4qbQHZFIsWR5L9vrJZv4x62WpFA==
X-Received: by 2002:aa7:946c:: with SMTP id t12mr37074241pfq.137.1579174602089; 
 Thu, 16 Jan 2020 03:36:42 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:1677:7d6f:b2c8:b07a:d4f3:9a2c])
 by smtp.gmail.com with ESMTPSA id r20sm23979875pgu.89.2020.01.16.03.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 03:36:41 -0800 (PST)
Message-ID: <b737551d2790d5dd5a5f30590aa1996e75552f8d.camel@gmail.com>
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
Date: Thu, 16 Jan 2020 17:06:36 +0530
In-Reply-To: <d2507ff6b1b9e89503f4171da6fbc80b3382d4ce.camel@gmail.com>
References: <1090dc9b-9556-f6ab-23dc-f7d0a8176220@web.de>
 <61e7b9f2d132e6bc9feb13ae8fc4636cd934f0b2.camel@gmail.com>
 <alpine.DEB.2.21.2001161158440.3888@hadrien>
 <d2507ff6b1b9e89503f4171da6fbc80b3382d4ce.camel@gmail.com>
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Cc: Julia Lawall <julia.lawall@inria.fr>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Markus Elfring <Markus.Elfring@web.de>,
 "cocci@systeme.lip6.fr" <cocci@systeme.lip6.fr>
Subject: Re: [Linux-kernel-mentees] [Cocci] [PATCH] parsing_c: Add space for
	tokens after *
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

T24gVGh1LCAyMDIwLTAxLTE2IGF0IDE3OjAxICswNTMwLCBKYXNrYXJhbiBTaW5naCB3cm90ZToK
PiBPbiBUaHUsIDIwMjAtMDEtMTYgYXQgMTE6NTkgKzAxMDAsIEp1bGlhIExhd2FsbCB3cm90ZToK
PiA+IE9uIFRodSwgMTYgSmFuIDIwMjAsIEphc2thcmFuIFNpbmdoIHdyb3RlOgo+ID4gCj4gPiA+
IE9uIFRodSwgMjAyMC0wMS0xNiBhdCAxMTo0MCArMDEwMCwgTWFya3VzIEVsZnJpbmcgd3JvdGU6
Cj4gPiA+ID4gPiBJbiBjZXJ0YWluIGNhc2VzLCB0aGVyZSBpcyBubyBzcGFjZSBhZGRlZCBhZnRl
ciB0aGUgUG9pbnRlcgo+ID4gPiA+ID4gdHlwZS4KPiA+ID4gPiAKPiA+ID4gPiBXaWxsIHN1Y2gg
YSBwcmV0dHktcHJpbnRpbmcgZGV0YWlsIG1hdHRlciBhbHNvIGZvciB0aGUKPiA+ID4gPiBjbGFy
aWZpY2F0aW9uCj4gPiA+ID4gb2YKPiA+ID4gPiBhIHRvcGljIGxpa2Ug4oCcTWFrZSBjaGFuZ2Ug
aW5mbHVlbmNlIGNvbmZpZ3VyYWJsZSBmb3IgY29kaW5nCj4gPiA+ID4gc3R5bGUKPiA+ID4gPiBy
dWxlc+KAnT8KPiA+ID4gPiBodHRwczovL2dpdGh1Yi5jb20vY29jY2luZWxsZS9jb2NjaW5lbGxl
L2lzc3Vlcy8zNwo+ID4gPiA+IAo+ID4gPiAKPiA+ID4gTm90IHN1cmUgd2hhdCB5b3UgbWVhbi4g
SWYgeW91IG1lYW4gdG8gc2F5IHRoYXQgdGhlIHJlc3VsdCBzaG91bGQKPiA+ID4gY29uZm9ybSB0
byB0aGUgTGludXggY29kaW5nIHN0eWxlIChpLmUuIHRoZSByZXN1bHQgc2hvdWxkIGJlCj4gPiA+
ICJjb25zdAo+ID4gPiBjaGFyICogY29uc3QgKiB5IiB3aXRoIHNwYWNlcyBldCBhbCBpbnRhY3Qp
LCB0aGF0IHNlZW1zIGxpa2UKPiA+ID4gc29tZXRoaW5nCj4gPiA+IGZvciBhIGRpZmZlcmVudCBw
YXRjaCwgcmlnaHQ/IFdoZXRoZXIgeW91IHdhbnQgQ29jY2luZWxsZSB0bwo+ID4gPiBjb25mb3Jt
IHRvCj4gPiA+IExpbnV4IGNvZGluZyBzdHlsZSBvciBub3QsIHRoZSBzcGFjZSBzaG91bGQgYmUg
YWRkZWQgZWl0aGVyIHdheS4KPiA+IAo+ID4gVGhlIG9wdGlvbiAtLXNtcGwtc3BhY2luZyBzaG91
bGQgYWRkcmVzcyB0aGlzIGlzc3VlLCBieSBwcmVzZXJ2aWduCj4gPiB0aGUKPiA+IHNwYWNpbmcg
aWxsdXN0cmF0ZWQgaW4gdGhlIHNlbWFudGljIHBhdGNoLiAgSSBkb24ndCBrbm93IGlmIGl0IGRv
ZXMKPiA+IHRoYXQKPiA+IGluIHRoaXMgY2FzZS4KPiA+IAo+IAo+IEhtLCBjYW4ndCBzYXkgdGhh
dCBpdCBkb2VzLiBIZXJlJ3Mgd2hhdCBJIGdldCB3aXRoIC0tc21wbC1zcGFjaW5nIG9uCj4gY2Fz
ZSBodHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29tL2NvY2NpQHN5c3RlbWUubGlwNi5mci9tc2cw
NjY5Ni5odG1sCj4gCgpXaG9vcHMsIGluY29ycmVjdCBsaW5rCmh0dHBzOi8vd3d3Lm1haWwtYXJj
aGl2ZS5jb20vY29jY2lAc3lzdGVtZS5saXA2LmZyL21zZzA2Njk1Lmh0bWwKCkNoZWVycywKSmFz
a2FyYW4uCgo+IGJlZm9yZToKPiAKPiAgdm9pZCBtYWluKCkgewo+IC0JY29uc3QgY2hhciAqIGNv
bnN0ICogeDsKPiArCWNvbnN0IGNoYXIgKmNvbnN0KnkgIDsKPiAgfQo+IAo+IGFmdGVyOgo+IAo+
ICB2b2lkIG1haW4oKSB7Cj4gLQljb25zdCBjaGFyICogY29uc3QgKiB4Owo+ICsJY29uc3QgY2hh
ciAqY29uc3QgKnkgIDsKPiAgfQo+IAo+IENoZWVycywKPiBKYXNrYXJhbi4KPiAKPiA+IGp1bGlh
Cj4gPiAKPiA+ID4gQ2hlZXJzLAo+ID4gPiBKYXNrYXJhbi4KPiA+ID4gCj4gPiA+ID4gUmVnYXJk
cywKPiA+ID4gPiBNYXJrdXMKPiA+ID4gCj4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gPiA+IENvY2NpIG1haWxpbmcgbGlzdAo+ID4gPiBDb2Nj
aUBzeXN0ZW1lLmxpcDYuZnIKPiA+ID4gaHR0cHM6Ly9zeXN0ZW1lLmxpcDYuZnIvbWFpbG1hbi9s
aXN0aW5mby9jb2NjaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50
ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRp
b24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
