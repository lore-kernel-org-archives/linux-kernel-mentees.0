Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F44C19F2C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  3 Aug 2022 09:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 009FB410C9;
	Wed,  3 Aug 2022 09:42:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 009FB410C9
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iFpHgcYu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xj-jBcPuKiDW; Wed,  3 Aug 2022 09:42:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B62E64032E;
	Wed,  3 Aug 2022 09:42:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B62E64032E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8FCF9C0033;
	Wed,  3 Aug 2022 09:42:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D372FC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 09:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B499561060
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 09:42:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B499561060
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iFpHgcYu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L31C1FicFcTn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 09:42:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0141F60812
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0141F60812
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 09:42:15 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id z16so20799198wrh.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 03 Aug 2022 02:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=k+YF9ia8v3GYpHFcptb/moFiQCtuPoH/DYSRMFgwu2w=;
 b=iFpHgcYuaui81Z2pL5x0xH1qahjQL2ILwyh7okH/70a+mEaNwwvhOW93blQ3dwZq5o
 aWKTNwaOZsnV7xp5JzFqinqouT+IfLyQ5p7HaCORNkuwgv6FugCCQjoX7iVfO5/8b6pS
 I+NfQw3SAQZ95Nwnz7b8FzR6SGIVQsgnyEUFDKUvYyHk16QvEKlgVfaNtsGpBM76rlml
 vIwpbNrLJUr2/Oc658BYdPn+H5DXBSS8GEoMKME7In0JG9Zj6scWNzZ1e91HlkNxc26f
 xu5iPUB+SFalQqqX6ZHaGqjhUEGq82L1nFWYUaIDLmSo1xeHbWh1dRpqtykesSJve/2D
 LX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=k+YF9ia8v3GYpHFcptb/moFiQCtuPoH/DYSRMFgwu2w=;
 b=MThIlTVocdUUuaA7ibxlG3ei93ex0lkWx1Dd3syTs3YnILKhASvYpeQPUwr4xCEPMG
 85ucLvPKkjAQj1gYsXXczI8EKFrhkZrhgOICcezhj1I75L+Uy7P3vb+AeSF7UWj4swpY
 HP4Dm1+CxMrIdZVpwIQvkWzrbQUkFVvA3+866AGr5FZk2fqJAA9tyA5Cpojc9kKNfEhe
 DxuiqHHcgBw0XYgD6QW7FL0yDSw3y9lzVEzv2ops7ouLaj8TpV92816TXpW+dnmeEFgE
 82D/dVLFCO7fC2iEVwfFhwn5g0KgFj6rw0qd8VgC/EHkMV4OMkknNycQ8RKwgbQBvbtz
 Rd8Q==
X-Gm-Message-State: ACgBeo0JHcMfZllIxgY7jd5M2G3caD+FEXJwhjRZ7tZYi8LbnH6Qav4q
 /34qlq3W3XfE09rAToWmrHE=
X-Google-Smtp-Source: AA6agR7UXPlJxQzoQRa0okevqRiQ+qQIkJKzCz8pKCkuyTpMHdsNpwW+AXCBNEc/ltnqgYfO19Nufw==
X-Received: by 2002:a5d:6642:0:b0:21e:f918:b093 with SMTP id
 f2-20020a5d6642000000b0021ef918b093mr15467912wrw.173.1659519734169; 
 Wed, 03 Aug 2022 02:42:14 -0700 (PDT)
Received: from gmail.com (84-236-113-167.pool.digikabel.hu. [84.236.113.167])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a5d4b82000000b0021e5bec14basm17936099wrt.5.2022.08.03.02.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 02:42:13 -0700 (PDT)
Date: Wed, 3 Aug 2022 11:42:11 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH] x86/numa: Use cpumask_available instead of hardcoded
 NULL check
Message-ID: <YupC88xuQ4rcyLVR@gmail.com>
References: <20220731160913.632092-1-code@siddh.me>
 <YukFgFTaq4Aw+uht@gmail.com>
 <1825f63b142.8968bde3116633.1242410031840350968@siddh.me>
 <Yuo2UkkyaYtZ3rMZ@gmail.com>
 <18262ed2459.44b0d74d434377.3690496800292832933@siddh.me>
 <Yuo7A0KYoNnbgwWT@gmail.com>
 <18263030220.8a990e82436929.3216192040531777412@siddh.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <18263030220.8a990e82436929.3216192040531777412@siddh.me>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
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

CiogU2lkZGggUmFtYW4gUGFudCA8Y29kZUBzaWRkaC5tZT4gd3JvdGU6Cgo+IE9uIFdlZCwgMDMg
QXVnIDIwMjIgMTQ6Mzg6MTkgKzA1MzAgIEluZ28gTW9sbmFyIDxtaW5nb0BrZXJuZWwub3JnPiB3
cm90ZToKPiA+IAo+ID4gKiBTaWRkaCBSYW1hbiBQYW50IDxjb2RlQHNpZGRoLm1lPiB3cm90ZToK
PiA+ID4gVGhlcmUgaXMgbm8gcmVhc29uIHdoeSBhbGxtb2Rjb25maWcgd291bGQgdHJpZ2dlciB0
aGUgd2FybmluZywgWy4uLl0KPiA+IAo+ID4gV2VsbCwgdW5sZXNzIEknbSBtaXNyZWFkaW5nIHlv
dXIgY2hhbmdlbG9nLCBhbGwgdGhlIHdhcm5pbmcgbmVlZHMgdG8gCj4gPiB0cmlnZ2VyIGlzIENP
TkZJR19DUFVNQVNLX09GRlNUQUNLPXkuCj4gPiAKPiA+ID4gYXMgaXQgaGFzIENPTkZJR19DUFVN
QVNLX09GRlNUQUNLPXksIGJ1dCB0aGUgd2FybmluZyBpcyBiZWNhdXNlIG9mIHRoZSAKPiA+ID4g
b3RoZXIgY2FzZS4KPiA+IAo+ID4gV2hhdCAnb3RoZXIgY2FzZSc/IEkndmUgcmUtcmVhZCB0aGUg
ZGlzY3Vzc2lvbiBhbmQgZG9uJ3Qgc2VlIGl0LCBidXQgbWF5YmUgCj4gPiBJJ20gYSBiaXQgZGFm
dCB0aGlzIG1vcm5pbmcgLi4uCj4gIAo+IE5vLCB0aGUgd2FybmluZyBpcyBoYXBwZW5pbmcgYmVj
YXVzZSBDT05GSUdfQ1BVTUFTS19PRkZTVEFDSyBpcyBub3Qgc2V0LgoKT2guIFNvIEkgd2FzIGRh
ZnQsIGFzIHN1c3BlY3RlZC4gOy0pCgpBbmQgSSBjYW4gY29uZmlybSB0aGF0IHdoaWxlIGdjYy0x
MSBkb2Vzbid0IHRyaWdnZXIgdGhlIHdhcm5pbmcsIGdjYy0xMiAKZG9lczoKCiAgJCBtYWtlIEFS
Q0g9eDg2XzY0IENDPWdjYy0xMSBhcmNoL3g4Ni9tbS9udW1hLm8KICAgIENDICAgICAgYXJjaC94
ODYvbW0vbnVtYS5vCiAgJAoKICAkIHJtIC1mIGFyY2gveDg2L21tL251bWEubwogICQKICAkIG1h
a2UgQVJDSD14ODZfNjQgQ0M9Z2NjLTEyIGFyY2gveDg2L21tL251bWEubwoKICAgIENDICAgICAg
YXJjaC94ODYvbW0vbnVtYS5vCiAgYXJjaC94ODYvbW0vbnVtYS5jOiBJbiBmdW5jdGlvbiDigJhj
cHVtYXNrX29mX25vZGXigJk6CiAgYXJjaC94ODYvbW0vbnVtYS5jOjkxNjozOTogZXJyb3I6IHRo
ZSBjb21wYXJpc29uIHdpbGwgYWx3YXlzIGV2YWx1YXRlIGFzIOKAmGZhbHNl4oCZIGZvciB0aGUg
YWRkcmVzcyBvZiDigJhub2RlX3RvX2NwdW1hc2tfbWFw4oCZIHdpbGwgbmV2ZXIgYmUgTlVMTCBb
LVdlcnJvcj1hZGRyZXNzXQogICAgOTE2IHwgICAgICAgICBpZiAobm9kZV90b19jcHVtYXNrX21h
cFtub2RlXSA9PSBOVUxMKSB7CgoKPiBbLi4uXSBUaGlzIGlzIGJlY2F1c2UgaW4gdGhhdCBjYXNl
IGNwdW1hc2tfdmFyX3QgdHlwZSBpcyBub3QgYSBwb2ludGVyLCAKPiBhbmQgdGh1cyB0aGUgdmFy
IGNhbiBuZXZlciBiZSBOVUxMLCB3aGljaCBsZWFkcyBnY2MgdG8gd2FybiB1cyB3aGVuIAo+IGNv
bXBhcmluZyB3aXRoIE5VTEwuCj4gCj4gVGhlIGNoYWluIG9mIGV2ZW50cyBhcmUgbGlrZToKPiAK
PiAgICAgICAgICNpZmRlZiBDT05GSUdfQ1BVTUFTS19PRkZTVEFDSwo+ICAgICAgICAgICAgICAg
ICB0eXBlZGVmIHN0cnVjdCBjcHVtYXNrICpjcHVtYXNrX3Zhcl90Owo+ICAgICAgICAgI2Vsc2UK
PiAgICAgICAgICAgICAgICAgdHlwZWRlZiBzdHJ1Y3QgY3B1bWFzayBjcHVtYXNrX3Zhcl90WzFd
Owo+ICAgICAgICAgZW5kaWYKPiAKPiAgICAgICAgIGNwdW1hc2tfdmFyX3Qgbm9kZV90b19jcHVt
YXNrX21hcFtNQVhfTlVNTk9ERVNdOwo+ICAgICAgICAgLi4uCj4gICAgICAgICBpZiAobm9kZV90
b19jcHVtYXNrX21hcFtub2RlXSA9PSBOVUxMKSB7Cj4gCj4gCj4gVGhlIGZpeCB3b3JrcyBiZWNh
dXNlOgo+IAo+ICAgICAgICAgI2lmZGVmIENPTkZJR19DUFVNQVNLX09GRlNUQUNLCj4gICAgICAg
ICAgICAgICAgIHN0YXRpYyBpbmxpbmUgYm9vbCBjcHVtYXNrX2F2YWlsYWJsZShjcHVtYXNrX3Zh
cl90IG1hc2spCj4gICAgICAgICAgICAgICAgIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gbWFzayAhPSBOVUxMOwo+ICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICAjZWxzZQo+
ICAgICAgICAgICAgICAgICBzdGF0aWMgaW5saW5lIGJvb2wgY3B1bWFza19hdmFpbGFibGUoY3B1
bWFza192YXJfdCBtYXNrKQo+ICAgICAgICAgICAgICAgICB7Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIHRydWU7Cj4gICAgICAgICAgICAgICAgIH0KPiAgICAgICAgIGVuZGlmCj4g
Cj4gCj4gVGhlIGNvbmRpdGlvbmFsIGRlZmluaXRpb25zLCBhcyBwb2ludGVkIG91dCBlYXJsaWVy
LCBjYW4gYmUgc2VlbiBmcm9tIGxpbmUgNzAwCj4gb2YgaW5jbHVkZS9saW51eC9jcHVtYXNrLmgg
ZmlsZS4KClllYWggLSBhbmQgSSBhZ3JlZSB3aXRoIHlvdXIgZml4IC0gd2lsbCBhcHBseSBpdC4K
ClRoYW5rcyBmb3IgeW91ciBwYXRpZW5jZSA6LSkKCglJbmdvCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcg
bGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5l
bC1tZW50ZWVzCg==
