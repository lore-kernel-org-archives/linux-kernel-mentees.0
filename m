Return-Path: <SRS0=K2BX=CA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D224EC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 07:56:01 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88DAA214F1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 07:56:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88DAA214F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7982E88326;
	Sat, 22 Aug 2020 07:56:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ztDi3zpnwo27; Sat, 22 Aug 2020 07:55:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 09E3988332;
	Sat, 22 Aug 2020 07:55:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4C4CC0889;
	Sat, 22 Aug 2020 07:55:58 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B37ADC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 07:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A924088332
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 07:55:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y1vNCh0l3MTT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 07:55:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0206.hostedemail.com
 [216.40.44.206])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A252C88326
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 07:55:55 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave08.hostedemail.com (Postfix) with ESMTP id CBCDA1801A77A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 05:30:26 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id 407F4182CED28;
 Sat, 22 Aug 2020 05:30:24 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: cover17_5f1646f2703f
X-Filterd-Recvd-Size: 2530
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf01.hostedemail.com (Postfix) with ESMTPA;
 Sat, 22 Aug 2020 05:30:22 +0000 (UTC)
Message-ID: <3836b482434bd0b9a609959d3696cc6113a93f2f.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Valdis =?UTF-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>
Date: Fri, 21 Aug 2020 22:30:21 -0700
In-Reply-To: <162653.1598067338@turing-police>
References: <20200818184107.f8af232fb58b17160c570874@linux-foundation.org>
 <3bf27caf462007dfa75647b040ab3191374a59de.camel@perches.com>
 <b0fd63e4b379eda69ee85ab098353582b8c054bb.camel@perches.com>
 <alpine.DEB.2.22.394.2008201021400.2524@hadrien>
 <a5713d8597065ef986f780499428fcc4cd31c003.camel@perches.com>
 <alpine.DEB.2.22.394.2008201856110.2524@hadrien>
 <744af177c09f8ce22c99d6e1df458bced558518b.camel@perches.com>
 <162653.1598067338@turing-police>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: Giuseppe Scrivano <gscrivan@redhat.com>,
 kernelnewbies <kernelnewbies@kernelnewbies.org>,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@inria.fr>,
 Andy Whitcroft <apw@shadowen.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, cocci <cocci@systeme.lip6.fr>
Subject: Re: [Linux-kernel-mentees] [Cocci] coccinelle: Convert comma to
 semicolons (was Re: [PATCH] checkpatch: Add test for comma use that should
 be semicolon)
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

T24gRnJpLCAyMDIwLTA4LTIxIGF0IDIzOjM1IC0wNDAwLCBWYWxkaXMgS2zEk3RuaWVrcyB3cm90
ZToKPiBPbiBGcmksIDIxIEF1ZyAyMDIwIDE4OjA4OjA4IC0wNzAwLCBKb2UgUGVyY2hlcyBzYWlk
Ogo+ID4gKGZvcndhcmRpbmcgb24gdG8ga2VybmVsLWphbml0b3JzL21lbnRlZXMgYW5kIGtlcm5l
bG5ld2JpZXMpCj4gPiAKPiA+IEp1c3QgZnlpIGZvciBhbnlvbmUgdGhhdCBjYXJlczoKPiA+IAo+
ID4gQSBqYW5pdG9yaWFsIHRhc2sgZm9yIHNvbWVvbmUgbWlnaHQgYmUgdG8gdXNlIEp1bGlhJ3Mg
Y29jY2luZWxsZQo+ID4gc2NyaXB0IGJlbG93IHRvIGNvbnZlcnQgdGhlIGV4aXN0aW5nIGluc3Rh
bmNlcyBvZiBjb21tYXMgdGhhdAo+ID4gc2VwYXJhdGUgc3RhdGVtZW50cyBpbnRvIHNlbWljb2xv
bnMuCj4gCj4gTm90ZSB0aGF0IHlvdSBuZWVkIHRvICpyZWFsbHkqIGNoZWNrIGZvciBwb3NzaWJs
ZSBjaGFuZ2VzIGluIHNlbWFudGljcy4KPiBJdCdzICp1c3VhbGx5KiBPSyB0byBkbyB0aGF0LCBi
dXQgc29tZXRpbWVzIGl0J3Mgbm90Li4uCj4gCj4gZm9yIChpPTA7IGkrKywgbGFzdCsrOyAhbGFz
dCkgewo+IAo+IGNoYW5naW5nIHRoYXQgY29tbWEgdG8gYSA7IHdpbGwgYnJlYWsgdGhlIGNvbXBp
bGUuICBJbiBvdGhlciBjYXNlcywgaXQgY2FuCj4gaW50cm9kdWNlIHN1YnRsZSBidWdzLgoKVHJ1
ZSBlbm91Z2ggZm9yIGEgZ2VuZXJhbCBzdGF0ZW1lbnQsIHRob3VnaCB0aGUgY29jY2luZWxsZQpz
Y3JpcHQgSnVsaWEgcHJvdmlkZWQgZG9lcyBub3QgY2hhbmdlIGEgc2luZ2xlIGluc3RhbmNlIG9m
CmZvciBsb29wIGV4cHJlc3Npb25zIHdpdGggY29tbWFzLgoKQXMgZmFyIGFzIEkgY2FuIHRlbGws
IG5vIGxvZ2ljIGRlZmVjdCBpcyBpbnRyb2R1Y2VkIGJ5IHRoZQpzY3JpcHQgYXQgYWxsLgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5l
bC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
