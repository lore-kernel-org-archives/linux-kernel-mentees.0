Return-Path: <SRS0=142Q=KC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47658C43460
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  7 May 2021 12:06:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B08260FE8
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  7 May 2021 12:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B08260FE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anirudhrb.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 382EC414EA;
	Fri,  7 May 2021 12:06:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZNHakDinqq8Z; Fri,  7 May 2021 12:06:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DA854066B;
	Fri,  7 May 2021 12:06:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02539C000D;
	Fri,  7 May 2021 12:06:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7EF9BC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 May 2021 12:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A99B4038D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 May 2021 12:06:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=anirudhrb.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zInKjuHUV2cN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 May 2021 12:06:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com
 [136.143.188.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A22440165
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 May 2021 12:06:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1620389165; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=UpEQCoHhDQKGv6r3fN5d01+wDAwQaB1PKZypPzxAbm+lLmM2wexZhU2ssq64TTDHEGDpi6Z7Leq9mUoWbHhPb6s9JH8lQ5uqSnKcwmyMFNpz+7dOeGyzULAYlO1YUn7RXO/OKv6fc9IpDRosMfO30LqV/Qlq85e1D0jz3vtgZZU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1620389165;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=p3Pk7bLis/jKEPW//LziYX2PKmJ0sD7MTLSUsjG64FY=; 
 b=j1ByB3WR3rZwytaAv+0v8Z/SJME8GbXvIuGCXIgrJUPYgwNnPko1mJgrRDdyEzLbN271WXWM5cujJWkQ0da8CPg5l5tB4V5Vxsk8hZVcGU9RawknpVL+R+GC21PBICc+uR7YveSA92mDa/OYdzF8OH/9vj+ESM47qXxjDAv1SEo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=anirudhrb.com;
 spf=pass  smtp.mailfrom=mail@anirudhrb.com;
 dmarc=pass header.from=<mail@anirudhrb.com> header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1620389165; 
 s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To;
 bh=p3Pk7bLis/jKEPW//LziYX2PKmJ0sD7MTLSUsjG64FY=;
 b=ldO7Q7pbL1ogBwqgRQXuzZQacYC8EuRrU5lnBkIuqD7DOnIy5F+KDi9Y5tWWe1ql
 oJjTvogwD9Y+Spmp90lNSzpIgIKX4Gurrcp38xyNCiyUgzHldy4BmWSTskC7uJ0OQ8R
 3unZnjdO1DZiOfDn46sxxWqHFGH6ctabQ60K9uZQ=
Received: from anirudhrb.com (49.207.210.243 [49.207.210.243]) by
 mx.zohomail.com with SMTPS id 1620389154890739.5910943620871;
 Fri, 7 May 2021 05:05:54 -0700 (PDT)
Date: Fri, 7 May 2021 17:35:48 +0530
From: Anirudh Rayabharam <mail@anirudhrb.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] rapidio: fix unused variable warning in rio_cm.c
Message-ID: <YJUtHCSm//0PlyYf@anirudhrb.com>
References: <20210506181837.4758-1-mail@anirudhrb.com>
 <YJTgmXwZyOgFPIHf@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJTgmXwZyOgFPIHf@kroah.com>
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

T24gRnJpLCBNYXkgMDcsIDIwMjEgYXQgMDg6Mzk6MjFBTSArMDIwMCwgR3JlZyBLSCB3cm90ZToK
PiBPbiBUaHUsIE1heSAwNiwgMjAyMSBhdCAxMTo0ODozNlBNICswNTMwLCBBbmlydWRoIFJheWFi
aGFyYW0gd3JvdGU6Cj4gPiBHQ0MgcHJvZHVjZXMgYW4gdW51c2VkIHZhcmlhYmxlIHdhcm5pbmcg
Zm9yICdyYyc6Cj4gPiAKPiA+IAlkcml2ZXJzL3JhcGlkaW8vcmlvX2NtLmM6IEluIGZ1bmN0aW9u
IOKAmHJpb190eGNxX2hhbmRsZXLigJk6Cj4gPiAJZHJpdmVycy9yYXBpZGlvL3Jpb19jbS5jOjY3
Mzo3OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhyY+KAmSBzZXQgYnV0Cj4gPiAJbm90IHVzZWQgWy1X
dW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4gPiAKPiA+IFRoZSByZXR1cm4gdmFsdWUgb2Ygcmlv
X2FkZF9vdXRiX21lc3NhZ2UoKSBpcyBhc3NpZ25lZCB0byAncmMnIGJ1dCBpdAo+ID4gaXMgbmV2
ZXIgdXNlZC4gRml4IHRoaXMgd2FybmluZyBieSBsb2dnaW5nIGFuIGVycm9yIGlmICdyYycgaXMg
bm9uLXplcm8uCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEFuaXJ1ZGggUmF5YWJoYXJhbSA8bWFp
bEBhbmlydWRocmIuY29tPgo+ID4gLS0tCj4gPiAKPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiBMb2cg
YW4gZXJyb3IgaW5zdGVhZCBvZiBqdXN0IHJlbW92aW5nICdyYycuCj4gPiAKPiA+IHYxOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjEwNTAxMDU1MDE4LjkyNDQtMS1tYWlsQGFuaXJ1
ZGhyYi5jb20vCj4gPiAKPiA+IC0tLQo+ID4gIGRyaXZlcnMvcmFwaWRpby9yaW9fY20uYyB8IDUg
KysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3JhcGlkaW8vcmlvX2NtLmMgYi9kcml2ZXJzL3JhcGlkaW8vcmlvX2Nt
LmMKPiA+IGluZGV4IDUwZWM1M2Q2N2E0Yy4uOTcxYTM2ZjFhMjNhIDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy9yYXBpZGlvL3Jpb19jbS5jCj4gPiArKysgYi9kcml2ZXJzL3JhcGlkaW8vcmlvX2Nt
LmMKPiA+IEBAIC02NzcsNiArNjc3LDExIEBAIHN0YXRpYyB2b2lkIHJpb190eGNxX2hhbmRsZXIo
c3RydWN0IGNtX2RldiAqY20sIGludCBzbG90KQo+ID4gIAkJCWNtLT50eF9idWZbY20tPnR4X3Ns
b3RdID0gcmVxLT5idWZmZXI7Cj4gPiAgCQkJcmMgPSByaW9fYWRkX291dGJfbWVzc2FnZShjbS0+
bXBvcnQsIHJlcS0+cmRldiwgY21ib3gsCj4gPiAgCQkJCQkJICByZXEtPmJ1ZmZlciwgcmVxLT5s
ZW4pOwo+ID4gKwkJCWlmIChyYykgewo+ID4gKwkJCQlyaW9jbV9lcnJvcigiRmFpbGVkIHRvIGFk
ZCBtc2cgdG8gdHggcXVldWUgKGVycj0lZCkiLAo+ID4gKwkJCQkJCXJjKTsKPiAKPiBUaGF0J3Mg
cHJldHR5IHBvaW50bGVzcyAoYW5kIG5vIG5lZWQgZm9yIHt9KS4KClRoZSBwb2ludCBpcyB0aGF0
IHRoaXMgZml4ZXMgdGhlIGNvbXBpbGVyIHdhcm5pbmcuCgpJIHVzZWQgdGhlIHt9IGJlY2F1c2Ug
SSBoYWQgdG8gc3BsaXQgdGhlIHN0YXRlbWVudCBpbnRvIHR3byBsaW5lcyBhbmQKdGhvdWdodCBp
dCBpcyBtb3JlIHJlYWRhYmxlIHdpdGggdGhlIHt9LiBjaGVja3BhdGNoIGRpZG4ndCBjb21wbGFp
bgphYm91dCBpdCBlaXRoZXIuCgo+IAo+IElmIGFuIGVycm9yIGhhcHBlbnMsIHByb3Blcmx5IHJl
Y292ZXIgZnJvbSBpdCwgZG9uJ3QganVzdCBwdW50IGFuZCB0ZWxsCj4gdGhlIHVzZXIgc29tZXRo
aW5nIGJhZCBoYXBwZW5lZCBhbmQgdGhlbiBpZ25vcmUgaXQuCgpUaGUgcHJpbWFyeSBtb3RpdmF0
aW9uIGJlaGluZCB0aGlzIHBhdGNoIGlzIHRvIGZpeCB0aGUgY29tcGlsZXIgd2FybmluZy4KVGhp
cyBlcnJvciBpcyBpZ25vcmVkIGV2ZW4gaW4gdGhlIGN1cnJlbnQgdHJlZS4gTXkgcGF0Y2ggYXQg
bGVhc3QgbG9ncyBpdApzbyB0aGF0IHBlb3BsZSBrbm93IHRoYXQgaXQncyBoYXBwZW5pbmcuIEFu
ZCBvbmNlIHRoZXkga25vdyB0aGF0IGl0J3MKaGFwcGVuaW5nIGFuZCBzb21lb25lIHdhbnRzIHRv
IHByb3BhZ2F0ZSB0aGUgZXJyb3IgY29kZSB0byB1c2Vyc3BhY2Ugb3IKaGFuZGxlIGl0IGRpZmZl
cmVudGx5IHRoZXkgY2FuIHdyaXRlIGEgcGF0Y2ggdG8gZG8gc28uCgpUaGFua3MhCgoJLSBBbmly
dWRoLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
