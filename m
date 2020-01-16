Return-Path: <SRS0=fgSf=3F=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5386C33CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jan 2020 11:32:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C94E2073A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jan 2020 11:32:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eexOSCt/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C94E2073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4673E86151;
	Thu, 16 Jan 2020 11:32:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DHw_gmYLLMrX; Thu, 16 Jan 2020 11:32:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E9A4386153;
	Thu, 16 Jan 2020 11:32:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D915DC1D82;
	Thu, 16 Jan 2020 11:32:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74D6BC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 11:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5DAE78684A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 11:32:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H2pJyw+rIg19
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 11:32:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E7CA9868F9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 11:32:06 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id k3so9765908pgc.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 03:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=iaxBDvzpV7RekMebeObpP+RPfeiR5JhvqOUni8sm2Js=;
 b=eexOSCt/LAAGlpa6zMRWxi6bECOTFEe41d6VvUip171W9yjEARrQ9CyB5fxwz7sp5H
 3pjeUOZOo4JhwtWIABeRMyVWi9Sm53AeXmf4N2Nnuc/kZIgYzfGDH0xD9BReprPJ1Rcw
 +bEgMdcowyP+QKd9UFW3G6SD1vRjtBggvg1SnnIM5fFPiuQbuAPauEj2SbocFPDJmL3G
 0H1N07Y51muDVQxzSW710NA5Vi/EOTq/CIgjfyRa1z5vYbUcdbCP2OrAqQ8DWHs8rrQl
 1aFmkjHeSvOPV8cDQREVgHqAkubgoTUI/6mMAO2SNcv9bzYqqd1o375X7a7kUvS3kd6m
 oSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=iaxBDvzpV7RekMebeObpP+RPfeiR5JhvqOUni8sm2Js=;
 b=WiFALYncd+fTOyezJdEHmOSjm9Muz5JGln3kas8u6E/HGG4hBbkFzVQVfr3wKkv1bD
 2QaXcDAbqTPeImI/5pDXQeoW6beVkZPi4xIgkc1DKVsEtTj0H1XnTWahppX1kdvKTAD4
 p+TlHhjLWiS/nJ8n/xe98W0PQgsNvad6noEQ08Bw16/eH0YQXIc4nnzMDMVG3KAyh3ov
 bhJAmkYQDi619jD1CV1lAJQc1VJf8Uo52nqoNIeNYDKuRfPyta+ijSEtFSvAl5dgpCx3
 VSFYrH9C+M9Ehl+9dfKCEghXVR2Jf9fOLkUpfnvQspZ8ta8xvoaw4jS2DaHKBTQ4X/O6
 MSLw==
X-Gm-Message-State: APjAAAU2E972NH1NJFfs3fsWI0TvbRratweLjTyNmdztTNKUGkWzOKiu
 /6EhVS/mx9AneNAQNbHkCI8SBP9V
X-Google-Smtp-Source: APXvYqyRMegpiA2s71CG2BdIqHQlK9z4keoV9SPcdWHTSB558xLNDkM+3F/kY0ighwb3W3T64dCtwg==
X-Received: by 2002:a63:4c4f:: with SMTP id m15mr38556217pgl.346.1579174326423; 
 Thu, 16 Jan 2020 03:32:06 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:1677:7d6f:b2c8:b07a:d4f3:9a2c])
 by smtp.gmail.com with ESMTPSA id x11sm24425005pfn.53.2020.01.16.03.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 03:32:05 -0800 (PST)
Message-ID: <d2507ff6b1b9e89503f4171da6fbc80b3382d4ce.camel@gmail.com>
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Date: Thu, 16 Jan 2020 17:01:59 +0530
In-Reply-To: <alpine.DEB.2.21.2001161158440.3888@hadrien>
References: <1090dc9b-9556-f6ab-23dc-f7d0a8176220@web.de>
 <61e7b9f2d132e6bc9feb13ae8fc4636cd934f0b2.camel@gmail.com>
 <alpine.DEB.2.21.2001161158440.3888@hadrien>
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
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

T24gVGh1LCAyMDIwLTAxLTE2IGF0IDExOjU5ICswMTAwLCBKdWxpYSBMYXdhbGwgd3JvdGU6Cj4g
Cj4gT24gVGh1LCAxNiBKYW4gMjAyMCwgSmFza2FyYW4gU2luZ2ggd3JvdGU6Cj4gCj4gPiBPbiBU
aHUsIDIwMjAtMDEtMTYgYXQgMTE6NDAgKzAxMDAsIE1hcmt1cyBFbGZyaW5nIHdyb3RlOgo+ID4g
PiA+IEluIGNlcnRhaW4gY2FzZXMsIHRoZXJlIGlzIG5vIHNwYWNlIGFkZGVkIGFmdGVyIHRoZSBQ
b2ludGVyCj4gPiA+ID4gdHlwZS4KPiA+ID4gCj4gPiA+IFdpbGwgc3VjaCBhIHByZXR0eS1wcmlu
dGluZyBkZXRhaWwgbWF0dGVyIGFsc28gZm9yIHRoZQo+ID4gPiBjbGFyaWZpY2F0aW9uCj4gPiA+
IG9mCj4gPiA+IGEgdG9waWMgbGlrZSDigJxNYWtlIGNoYW5nZSBpbmZsdWVuY2UgY29uZmlndXJh
YmxlIGZvciBjb2Rpbmcgc3R5bGUKPiA+ID4gcnVsZXPigJ0/Cj4gPiA+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9jb2NjaW5lbGxlL2NvY2NpbmVsbGUvaXNzdWVzLzM3Cj4gPiA+IAo+ID4gCj4gPiBOb3Qg
c3VyZSB3aGF0IHlvdSBtZWFuLiBJZiB5b3UgbWVhbiB0byBzYXkgdGhhdCB0aGUgcmVzdWx0IHNo
b3VsZAo+ID4gY29uZm9ybSB0byB0aGUgTGludXggY29kaW5nIHN0eWxlIChpLmUuIHRoZSByZXN1
bHQgc2hvdWxkIGJlICJjb25zdAo+ID4gY2hhciAqIGNvbnN0ICogeSIgd2l0aCBzcGFjZXMgZXQg
YWwgaW50YWN0KSwgdGhhdCBzZWVtcyBsaWtlCj4gPiBzb21ldGhpbmcKPiA+IGZvciBhIGRpZmZl
cmVudCBwYXRjaCwgcmlnaHQ/IFdoZXRoZXIgeW91IHdhbnQgQ29jY2luZWxsZSB0bwo+ID4gY29u
Zm9ybSB0bwo+ID4gTGludXggY29kaW5nIHN0eWxlIG9yIG5vdCwgdGhlIHNwYWNlIHNob3VsZCBi
ZSBhZGRlZCBlaXRoZXIgd2F5Lgo+IAo+IFRoZSBvcHRpb24gLS1zbXBsLXNwYWNpbmcgc2hvdWxk
IGFkZHJlc3MgdGhpcyBpc3N1ZSwgYnkgcHJlc2Vydmlnbgo+IHRoZQo+IHNwYWNpbmcgaWxsdXN0
cmF0ZWQgaW4gdGhlIHNlbWFudGljIHBhdGNoLiAgSSBkb24ndCBrbm93IGlmIGl0IGRvZXMKPiB0
aGF0Cj4gaW4gdGhpcyBjYXNlLgo+IAoKSG0sIGNhbid0IHNheSB0aGF0IGl0IGRvZXMuIEhlcmUn
cyB3aGF0IEkgZ2V0IHdpdGggLS1zbXBsLXNwYWNpbmcgb24KY2FzZSBodHRwczovL3d3dy5tYWls
LWFyY2hpdmUuY29tL2NvY2NpQHN5c3RlbWUubGlwNi5mci9tc2cwNjY5Ni5odG1sCgpiZWZvcmU6
Cgogdm9pZCBtYWluKCkgewotCWNvbnN0IGNoYXIgKiBjb25zdCAqIHg7CisJY29uc3QgY2hhciAq
Y29uc3QqeSAgOwogfQoKYWZ0ZXI6Cgogdm9pZCBtYWluKCkgewotCWNvbnN0IGNoYXIgKiBjb25z
dCAqIHg7CisJY29uc3QgY2hhciAqY29uc3QgKnkgIDsKIH0KCkNoZWVycywKSmFza2FyYW4uCgo+
IGp1bGlhCj4gCj4gPiBDaGVlcnMsCj4gPiBKYXNrYXJhbi4KPiA+IAo+ID4gPiBSZWdhcmRzLAo+
ID4gPiBNYXJrdXMKPiA+IAo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiA+IENvY2NpIG1haWxpbmcgbGlzdAo+ID4gQ29jY2lAc3lzdGVtZS5saXA2
LmZyCj4gPiBodHRwczovL3N5c3RlbWUubGlwNi5mci9tYWlsbWFuL2xpc3RpbmZvL2NvY2NpCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJu
ZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhm
b3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
