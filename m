Return-Path: <SRS0=142Q=KC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87501C43460
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  7 May 2021 06:39:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F799613CD
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  7 May 2021 06:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F799613CD
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6B9083BAE;
	Fri,  7 May 2021 06:39:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4upt8U3LaEQW; Fri,  7 May 2021 06:39:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08F7883B9D;
	Fri,  7 May 2021 06:39:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6BABC000D;
	Fri,  7 May 2021 06:39:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64C55C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 May 2021 06:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52DE64050D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 May 2021 06:39:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dOzH5fgAxfNM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 May 2021 06:39:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F616404F9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 May 2021 06:39:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E2EB613C2;
 Fri,  7 May 2021 06:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1620369563;
 bh=c3d7dymFXiq6stuNWLRIYzL07V5AfPuPEUz1cUVvTi4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZBQi6HXFc6xYPZTsJstosCYIiEjKj4RuCtf0r7PAUwEKLU5ZFLEvZNi4e/gydtmXJ
 uactbMNwy9BiAHpyMSOnU5YYOCIp4+jI/CIW7ZGvCeyTFXK2B8KeZ2pSRV8T0U90FB
 2HZmMzwIsd9v1dRxaouTo5gHCKw6dZHsBpyMtyEk=
Date: Fri, 7 May 2021 08:39:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Anirudh Rayabharam <mail@anirudhrb.com>
Subject: Re: [PATCH v2] rapidio: fix unused variable warning in rio_cm.c
Message-ID: <YJTgmXwZyOgFPIHf@kroah.com>
References: <20210506181837.4758-1-mail@anirudhrb.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210506181837.4758-1-mail@anirudhrb.com>
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

T24gVGh1LCBNYXkgMDYsIDIwMjEgYXQgMTE6NDg6MzZQTSArMDUzMCwgQW5pcnVkaCBSYXlhYmhh
cmFtIHdyb3RlOgo+IEdDQyBwcm9kdWNlcyBhbiB1bnVzZWQgdmFyaWFibGUgd2FybmluZyBmb3Ig
J3JjJzoKPiAKPiAJZHJpdmVycy9yYXBpZGlvL3Jpb19jbS5jOiBJbiBmdW5jdGlvbiDigJhyaW9f
dHhjcV9oYW5kbGVy4oCZOgo+IAlkcml2ZXJzL3JhcGlkaW8vcmlvX2NtLmM6NjczOjc6IHdhcm5p
bmc6IHZhcmlhYmxlIOKAmHJj4oCZIHNldCBidXQKPiAJbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1z
ZXQtdmFyaWFibGVdCj4gCj4gVGhlIHJldHVybiB2YWx1ZSBvZiByaW9fYWRkX291dGJfbWVzc2Fn
ZSgpIGlzIGFzc2lnbmVkIHRvICdyYycgYnV0IGl0Cj4gaXMgbmV2ZXIgdXNlZC4gRml4IHRoaXMg
d2FybmluZyBieSBsb2dnaW5nIGFuIGVycm9yIGlmICdyYycgaXMgbm9uLXplcm8uCj4gCj4gU2ln
bmVkLW9mZi1ieTogQW5pcnVkaCBSYXlhYmhhcmFtIDxtYWlsQGFuaXJ1ZGhyYi5jb20+Cj4gLS0t
Cj4gCj4gQ2hhbmdlcyBpbiB2MjoKPiBMb2cgYW4gZXJyb3IgaW5zdGVhZCBvZiBqdXN0IHJlbW92
aW5nICdyYycuCj4gCj4gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMTA1MDEw
NTUwMTguOTI0NC0xLW1haWxAYW5pcnVkaHJiLmNvbS8KPiAKPiAtLS0KPiAgZHJpdmVycy9yYXBp
ZGlvL3Jpb19jbS5jIHwgNSArKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmFwaWRpby9yaW9fY20uYyBiL2RyaXZlcnMvcmFw
aWRpby9yaW9fY20uYwo+IGluZGV4IDUwZWM1M2Q2N2E0Yy4uOTcxYTM2ZjFhMjNhIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvcmFwaWRpby9yaW9fY20uYwo+ICsrKyBiL2RyaXZlcnMvcmFwaWRpby9y
aW9fY20uYwo+IEBAIC02NzcsNiArNjc3LDExIEBAIHN0YXRpYyB2b2lkIHJpb190eGNxX2hhbmRs
ZXIoc3RydWN0IGNtX2RldiAqY20sIGludCBzbG90KQo+ICAJCQljbS0+dHhfYnVmW2NtLT50eF9z
bG90XSA9IHJlcS0+YnVmZmVyOwo+ICAJCQlyYyA9IHJpb19hZGRfb3V0Yl9tZXNzYWdlKGNtLT5t
cG9ydCwgcmVxLT5yZGV2LCBjbWJveCwKPiAgCQkJCQkJICByZXEtPmJ1ZmZlciwgcmVxLT5sZW4p
Owo+ICsJCQlpZiAocmMpIHsKPiArCQkJCXJpb2NtX2Vycm9yKCJGYWlsZWQgdG8gYWRkIG1zZyB0
byB0eCBxdWV1ZSAoZXJyPSVkKSIsCj4gKwkJCQkJCXJjKTsKClRoYXQncyBwcmV0dHkgcG9pbnRs
ZXNzIChhbmQgbm8gbmVlZCBmb3Ige30pLgoKSWYgYW4gZXJyb3IgaGFwcGVucywgcHJvcGVybHkg
cmVjb3ZlciBmcm9tIGl0LCBkb24ndCBqdXN0IHB1bnQgYW5kIHRlbGwKdGhlIHVzZXIgc29tZXRo
aW5nIGJhZCBoYXBwZW5lZCBhbmQgdGhlbiBpZ25vcmUgaXQuCgp0aGFua3MsCgpncmVnIGstaApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJu
ZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhm
b3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
