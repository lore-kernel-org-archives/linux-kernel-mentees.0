Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3531E743F1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 Sep 2023 07:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C9C060A8D;
	Fri, 29 Sep 2023 07:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C9C060A8D
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mailo.com header.i=@mailo.com header.a=rsa-sha256 header.s=mailo header.b=h4UfrgMc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JAZ7LAhermqj; Fri, 29 Sep 2023 07:34:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D6969607CA;
	Fri, 29 Sep 2023 07:34:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6969607CA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8D36C0039;
	Fri, 29 Sep 2023 07:34:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99AC7C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Sep 2023 07:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E05460A8D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Sep 2023 07:34:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E05460A8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SLzx24SP19Xx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Sep 2023 07:34:03 +0000 (UTC)
Received: from mailo.com (msg-1.mailo.com [213.182.54.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C4ECE607CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Sep 2023 07:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4ECE607CA
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1695972824; bh=Mxk9l/U073uStCFV2UzL0Jvqq/Vo4Ln1BTaY+q264Og=;
 h=X-EA-Auth:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
 b=h4UfrgMc/GsgctxJuapIvK1n7NV2LISZyjM4eagWufGdxYn3a8T9eGQXeex2tADbM
 RuSfnz0Aa2M1r9OmxMjaANzArsx8eleoOeYnBkl5bAn7kmPTMU47MmBq66hAGYQnXS
 ffsVjkZKidUECmxdEiX+EkZhCkxEgQWxHEYbKBkg=
Received: by b221-6.in.mailobj.net [192.168.90.26] with ESMTP
 via ip-20.mailobj.net [213.182.54.20]
 Fri, 29 Sep 2023 09:33:44 +0200 (CEST)
X-EA-Auth: Kph+n6amj/OpMbnfaagrjIvIfM2f1llYlstIKcYMbu7B9oWx5SNQR1QBvj0B4fmVvei9+OhAtDxj3qPLNaYgUr/AVERwIYts
Message-ID: <f8e478c86bb80f37fbedc4f17b782918bc1c3607.camel@mailo.com>
Subject: Re: [PATCH] gfs2: Set error on error path
From: drv <drv@mailo.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Date: Fri, 29 Sep 2023 13:02:51 +0530
In-Reply-To: <72de9c2e-7c60-4930-acfb-556a1f0fa4c4@kadam.mountain>
References: <ZRZrUMzweaJeEJuD@runicha.com>
 <72de9c2e-7c60-4930-acfb-556a1f0fa4c4@kadam.mountain>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Cc: Andreas Gruenbacher <agruenba@redhat.com>, linux-kernel@vger.kernel.org,
 gfs2@lists.linux.dev, Bob Peterson <rpeterso@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Dan Carpenter <error27@gmail.com>
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

T24gRnJpLCAyMDIzLTA5LTI5IGF0IDEwOjE0ICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOgo+
IE9uIEZyaSwgU2VwIDI5LCAyMDIzIGF0IDExOjQ0OjQwQU0gKzA1MzAsIERlZXBhayBSIFZhcm1h
IHdyb3RlOgo+ID4gU2V0IHRoZSBlcnJvciB2YXJpYWJsZSBpbnNpZGUgdGhlIGVycm9yIHBhdGgg
b24gZmFpbHVyZS4gU2F2ZXMKPiA+IHVubmVjZXNzYXJ5IHZhcmlhYmxlIGFzc2lnbm1lbnQgZHVy
aW5nIG5vcm1hbCBleGVjdXRpb24uCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IERlZXBhayBSIFZh
cm1hIDxkcnZAbWFpbG8uY29tPgo+ID4gLS0tCj4gPiDCoGZzL2dmczIvYm1hcC5jIHwgNSArKyst
LQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZnMvZ2ZzMi9ibWFwLmMgYi9mcy9nZnMyL2JtYXAuYwo+ID4g
aW5kZXggZWY3MDE3ZmI2OTUxLi45M2JkOGVhMzQ0NDQgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9nZnMy
L2JtYXAuYwo+ID4gKysrIGIvZnMvZ2ZzMi9ibWFwLmMKPiA+IEBAIC0xNjIsOSArMTYyLDEwIEBA
IGludCBnZnMyX3Vuc3R1ZmZfZGlub2RlKHN0cnVjdCBnZnMyX2lub2RlICppcCkKPiA+IMKgCj4g
PiDCoMKgwqDCoMKgwqDCoMKgZG93bl93cml0ZSgmaXAtPmlfcndfbXV0ZXgpOwo+ID4gwqDCoMKg
wqDCoMKgwqDCoHBhZ2UgPSBncmFiX2NhY2hlX3BhZ2UoaW5vZGUtPmlfbWFwcGluZywgMCk7Cj4g
PiAtwqDCoMKgwqDCoMKgwqBlcnJvciA9IC1FTk9NRU07Cj4gPiAtwqDCoMKgwqDCoMKgwqBpZiAo
IXBhZ2UpCj4gPiArwqDCoMKgwqDCoMKgwqBpZiAoIXBhZ2UpIHsKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBlcnJvciA9IC1FTk9NRU07Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGdvdG8gb3V0Owo+ID4gK8KgwqDCoMKgwqDCoMKgfQo+IAo+IEl0IHVzZWQg
dG8gYmUgdGhhdCB0aGUgb3RoZXIgd2F5IHdhcyBmYXN0ZXI/wqAgSSdtIHByZXR0eSBzdXJlIHRo
ZQo+IGNvbXBpbGVyIGNhbiBmaWd1cmUgaXQgb3V0IHRoZXNlIGRheXMuwqAgUGxlYXNlIGRvbid0
IHJhbmRvbWx5IHN0YXJ0Cj4gY2hhbmdpbmcgcGVvcGxlJ3MgcHJlZmVyZWQgc3R5bGUgdW5sZXNz
IGl0J3MgZHJpdmVycy9zdGFnaW5nLyBjb2RlLgo+IApIaSBEYW4sClRoYW5rIHlvdSBmb3IgdGhl
IGZlZWRiYWNrLiBJIGRpZCBub3Qga25vdyBhYm91dCB0aGUgY29tcGlsZXIKb3B0aW1pemF0aW9u
IHJlc3VsdGluZyBpbiBvcmlnaW5hbCBjb2RlIGJlaW5nIGZhc3Rlci4KSSB3aWxsIGxldCB0aGUg
bWFpbnRhaW5lcnMgY29tbWVudCBvbiBicmVha2luZyB0aGUgc3R5bGUuCgpyZWdhcmRzLApkZWVw
YWsuCgo+IHJlZ2FyZHMsCj4gZGFuIGNhcnBlbnRlcgo+IAoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5n
IGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJu
ZWwtbWVudGVlcwo=
