Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D72C19F28
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  3 Aug 2022 09:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5F3B81BBD;
	Wed,  3 Aug 2022 09:46:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5F3B81BBD
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=LjjQilOD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4adK2DngBBin; Wed,  3 Aug 2022 09:46:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C4A9D81B70;
	Wed,  3 Aug 2022 09:46:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4A9D81B70
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85CFCC0033;
	Wed,  3 Aug 2022 09:46:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8CAFDC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 09:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AC0F6F715
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 09:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AC0F6F715
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=LjjQilOD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m3Z5mgMiTZH0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 09:46:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E913461060
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E913461060
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 09:46:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1659519997; cv=none; d=zohomail.in; s=zohoarc; 
 b=XvWsWjE8t5zW4M60jT2kOoKrtmPXvGOMsKVwKyiC2PnFszBqjdRoLPEB5p0Gm4snpFnbYZXTpo2f16yAE99b5YKURvkAqOpSpV5x+fcKGA+qHTZ9eoviJpaSLmXBMEjSoOQdwCbL6hIrRDBCVDyg36UZvsrFYIrC069hNuHmhpY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1659519997;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=tCHNfkvLKa0BySi4rSrFMkX48wCJeADFiMbfJkU5ves=; 
 b=HOyH+TgaaaO2ChMWCD3C9KPP3EGmrp0QUke4MOKwGprGZFQbFRQp2xY9Tyyz1Plz5al4841MlxDMKySAaxJH9rog+bQClxfO6KmUcnb5DaNhRAWlZbs+p/c19AN2GoqAjkTfstZP4KCTqfHkN47VuysSTIieON8M5FOw4lISLis=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659519997; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=tCHNfkvLKa0BySi4rSrFMkX48wCJeADFiMbfJkU5ves=;
 b=LjjQilODd69kMHJImKMUgwONAibLg0YAN8FOsMPeE36IMjtDxzLrJj9TY/02IOqe
 rezK8hZNAgPX0BkAmfPwP/s8bqbqgOW/MpEIK7ECFtoMn1CH3yZ9MJfBduOnZBv2L/h
 Ky8fP0E8dFzeKVY9obsL3O2nyFW+hyIdjbg/9I3M=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1659519981497938.089830690879;
 Wed, 3 Aug 2022 15:16:21 +0530 (IST)
Date: Wed, 03 Aug 2022 15:16:21 +0530
To: "Ingo Molnar" <mingo@kernel.org>
Message-ID: <182631957a7.c72ff42439506.3030495024426988155@siddh.me>
In-Reply-To: <YupC88xuQ4rcyLVR@gmail.com>
References: <20220731160913.632092-1-code@siddh.me>
 <YukFgFTaq4Aw+uht@gmail.com>
 <1825f63b142.8968bde3116633.1242410031840350968@siddh.me>
 <Yuo2UkkyaYtZ3rMZ@gmail.com>
 <18262ed2459.44b0d74d434377.3690496800292832933@siddh.me>
 <Yuo7A0KYoNnbgwWT@gmail.com>
 <18263030220.8a990e82436929.3216192040531777412@siddh.me>
 <YupC88xuQ4rcyLVR@gmail.com>
Subject: Re: [PATCH] x86/numa: Use cpumask_available instead of hardcoded
 NULL check
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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
From: Siddh Raman Pant via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Siddh Raman Pant <code@siddh.me>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gV2VkLCAwMyBBdWcgMjAyMiAxNToxMjoxMSArMDUzMCAgSW5nbyBNb2xuYXIgPG1pbmdvQGtl
cm5lbC5vcmc+IHdyb3RlOgo+IE9oLiBTbyBJIHdhcyBkYWZ0LCBhcyBzdXNwZWN0ZWQuIDstKQo+
IAo+IEFuZCBJIGNhbiBjb25maXJtIHRoYXQgd2hpbGUgZ2NjLTExIGRvZXNuJ3QgdHJpZ2dlciB0
aGUgd2FybmluZywgZ2NjLTEyIAo+IGRvZXM6Cj4gCj4gICAkIG1ha2UgQVJDSD14ODZfNjQgQ0M9
Z2NjLTExIGFyY2gveDg2L21tL251bWEubwo+ICAgICBDQyAgICAgIGFyY2gveDg2L21tL251bWEu
bwo+ICAgJAo+IAo+ICAgJCBybSAtZiBhcmNoL3g4Ni9tbS9udW1hLm8KPiAgICQKPiAgICQgbWFr
ZSBBUkNIPXg4Nl82NCBDQz1nY2MtMTIgYXJjaC94ODYvbW0vbnVtYS5vCj4gCj4gICAgIENDICAg
ICAgYXJjaC94ODYvbW0vbnVtYS5vCj4gICBhcmNoL3g4Ni9tbS9udW1hLmM6IEluIGZ1bmN0aW9u
IOKAmGNwdW1hc2tfb2Zfbm9kZeKAmToKPiAgIGFyY2gveDg2L21tL251bWEuYzo5MTY6Mzk6IGVy
cm9yOiB0aGUgY29tcGFyaXNvbiB3aWxsIGFsd2F5cyBldmFsdWF0ZSBhcyDigJhmYWxzZeKAmSBm
b3IgdGhlIGFkZHJlc3Mgb2Yg4oCYbm9kZV90b19jcHVtYXNrX21hcOKAmSB3aWxsIG5ldmVyIGJl
IE5VTEwgWy1XZXJyb3I9YWRkcmVzc10KPiAgICAgOTE2IHwgICAgICAgICBpZiAobm9kZV90b19j
cHVtYXNrX21hcFtub2RlXSA9PSBOVUxMKSB7Cj4gCj4gCj4gPiBbLi4uXQo+IAo+IFllYWggLSBh
bmQgSSBhZ3JlZSB3aXRoIHlvdXIgZml4IC0gd2lsbCBhcHBseSBpdC4KPiAKPiBUaGFua3MgZm9y
IHlvdXIgcGF0aWVuY2UgOi0pCj4gCj4gICAgIEluZ28KPiAKCk5vIHdvcnJpZXMsIGFuZCB0aGFu
a3MhIDopClNpZGRoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVl
c0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9u
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
