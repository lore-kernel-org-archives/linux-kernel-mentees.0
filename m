Return-Path: <SRS0=b7VJ=MU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 906D8C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Jul 2021 22:55:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1712360EFD
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Jul 2021 22:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1712360EFD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDE3F405E7;
	Wed, 28 Jul 2021 22:55:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7b99eOmwHQ1G; Wed, 28 Jul 2021 22:55:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EA4C2402EF;
	Wed, 28 Jul 2021 22:55:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0913C0010;
	Wed, 28 Jul 2021 22:55:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4061C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 22:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EF87402CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 22:55:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HTlDA795ZH9E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 22:55:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09709400EB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 22:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=iXq6gtJgg/KgevAKbbPdcmL6v/tjqWXVyd71VWdu32g=; b=aI/AM99FpdL/zSIAo7Uo0E+CGl
 +6s2Jzg6JH7umPO7PnUwe9u26jTVXQ90CLsXspPyQcEh6GF7iq/xzNwOlz9QtYBUO1+Jior47Leye
 UHbOSgx9TfIJDmqaHIgYJpSATyZdCW09tJqjuopHP0ufQWUcBHwe0z5TPdOJcDcLU9iP6dQQr1abz
 ocoaW5D52xHSV9dtD/KAKwJ/Z4yAkC+zsAnAxwyZkj6mQFREHGcJ9yVQeohCgBX+xuqgGk4EodYGz
 wMCm3iDoURIPA+0kNsRrt1HPIOqu5kml7t1whfX/Ns632XWKij1/cjzkovQ3wo+iurrNMmiIZOtlb
 1dFvZjgg==;
Received: from [2601:1c0:6280:3f0::aefb]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8sSo-002Vco-EI; Wed, 28 Jul 2021 22:55:46 +0000
Subject: Re: patch suggestion: Kconfig symbols
To: Joe Perches <joe@perches.com>
References: <295b8f8c-4264-9f32-6723-9d2d574021ac@infradead.org>
 <e77e2329bdafdbea538be0d7edb8a9d7d3e45990.camel@perches.com>
 <09db53b9-7edf-44fc-c6b7-7c4e9198a2d4@infradead.org>
 <733d2747b67a8a172333b51bacbf77fe@perches.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a89eefda-df18-0965-e56c-a1b73975b8c3@infradead.org>
Date: Wed, 28 Jul 2021 15:55:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <733d2747b67a8a172333b51bacbf77fe@perches.com>
Content-Language: en-US
Cc: kernel-janitors <kernel-janitors@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 LKML <linux-kernel@vger.kernel.org>
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

T24gNy8yOC8yMSAyOjMwIFBNLCBKb2UgUGVyY2hlcyB3cm90ZToKPiBPbiAyMDIxLTA3LTI4IDEy
OjQxLCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4+IE9uIDcvMjgvMjEgODozNyBBTSwgSm9lIFBlcmNo
ZXMgd3JvdGU6Cj4+PiBPbiBNb24sIDIwMjEtMDctMjYgYXQgMTc6MjEgLTA3MDAsIFJhbmR5IER1
bmxhcCB3cm90ZToKPj4+PiBSdW5uaW5nIHNjcmlwdHMvY2hlY2trY29uZmlnc3ltYm9scy5weSBy
ZXBvcnRzIHNldmVyYWwgaHVuZHJlZCAobWF5YmUgdGhvdXNhbmQpCj4+Pj4gS2NvbmZpZyBzeW1i
b2xzIHRoYXQgYXJlIHVzZWQgcXVlc3Rpb25hYmx5LiBMb3RzIG9mIHRoZXNlIGFyZSBmYWxzZSBw
b3NpdGl2ZXMKPj4+PiBidXQgbG90cyBvZiB0aGUgcmVtYWluZGVyIGNvdWxkIHVzZSBzb21lIGNs
ZWFuaW5nIHVwLgo+Pj4gW10KPj4+PiBGYWxzZSBwb3NpdGl2ZSBleGFtcGxlOgo+Pj4+Cj4+Pj4g
WENIT0ZGTERfTUVNCj4+Pj4gUmVmZXJlbmNpbmcgZmlsZXM6IGRyaXZlcnMvc2NzaS9xbGEyeHh4
L3FsYV9tYnguYwo+Pj4+IFNpbWlsYXIgc3ltYm9sczogT0ZfUE1FTSwgQ1hMX01FTSwgQ1hMX1BN
RU0KPj4+Pgo+Pj4+IFRoZSBSZWZlcmVuY2luZyBzb3VyY2UgZmlsZSBkb2VzIHRoaXM6Cj4+Pj4g
I2RlZmluZSBDT05GSUdfWENIT0ZGTERfTUVNwqDCoMKgIDB4Mwo+Pj4+Cj4+Pj4gd2hpY2ggaXMg
bGVnaXRpbWF0ZSwgc28gbm8gY2hhbmdlIGlzIG5lZWRlZC4KPj4+Cj4+PiBMZWdpdGltYXRlIGlz
IHBlcmhhcHMgZHViaW91cy4KPj4+Cj4+PiBJdCBtaWdodCBiZSBiZXR0ZXIgaWYgS2NvbmZpZyBo
YXMgZXhjbHVzaXZlIHVzZSBvZiBDT05GSUdfPGZvbz4gbmFtaW5nIHNvCj4+PiByZW5hbWluZyBh
bGwgdGhlIG90aGVyIGV4aXN0aW5nIENPTkZJR188Zm9vPiBkZWZpbmVzIG1pZ2h0IGJlIGFwcHJv
cHJpYXRlLgo+Pgo+PiBJIHdvdWxkIHByZWZlciB0aGF0IGFzIHdlbGwgLS0gbWF5YmUgMTUgeWVh
cnMgYWdvLgo+PiBCdXQgSSB0aGluayBpdCdzIHRvbyBpbnZhc2l2ZSB0byBtYWtlIHRoYXQgY2hh
bmdlIG5vdy4KPiAKPiBJIGRvIG5vdCB0aGluayBpdCdzIHRoYXQgaW52YXNpdmUuCj4gCj4gSXQn
cyBzb21ldGhpbmcgdGhhdCBkb2Vzbid0IGhhdmUgdG8gYmUgZG9uZSBpbW1lZGlhdGVseSBlaXRo
ZXIuCj4gCj4gSXQncyBub3QgdG9vIG1hbnkgbWFjcm8gZGVmaW5lcyBhbmQgbm90IHRvbyBtYW55
IHVzZXMgb2YgdGhvc2UgZGVmaW5lcy4KCk9LIDopCgpJJ20gbm90IHRyeWluZyB0byBwcmV2ZW50
IHN1Y2ggYSBjaGFuZ2UuCgpHZXR0aW5nIHRoZSBleGNsdXNpdmUgdXNlIG9mIENPTkZJR19zeW1i
b2xzIGJlaW5nIGRlZGljYXRlZCB0bwpLY29uZmlnIG5hbWVzcGFjZSBpcyB0aGUgYnVnIGh1cmRs
ZSAoSU1PKS4KCi0tIAp+UmFuZHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJu
ZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhm
b3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
