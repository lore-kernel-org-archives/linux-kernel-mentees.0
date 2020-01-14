Return-Path: <SRS0=Bxrf=3D=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2ACC33C9E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jan 2020 19:42:03 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3301F24655
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jan 2020 19:42:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="fBEWXnlX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3301F24655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0E80A86092;
	Tue, 14 Jan 2020 19:42:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QjnwYi9G14r2; Tue, 14 Jan 2020 19:41:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6012486099;
	Tue, 14 Jan 2020 19:41:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54271C18DD;
	Tue, 14 Jan 2020 19:41:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 159E3C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 19:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0A5E485A03
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 19:41:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KfybLenT3x0S
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 19:41:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 00D1D8594B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 19:41:50 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id i13so13559234qtr.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 11:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=VD1VewVfYzcowrTTTc3p/NP2nAZZrqrdh/Y1+DTe6+o=;
 b=fBEWXnlXPRTh7yxZ1lkX1I9O8Fi9nn1GRvSKPOkv4DsNb4xxnzRKN8cEU9sILm04e0
 bKvt9UFvIMbTWGHhe7YTvvPlQDW+At6DCbGnIalW77Mbrd7GEnLW6iSGjbYNeu/LHoc5
 iegGOQZeFHQqNfRl+EQxvE6XDKCXAbG+HJQYE6lRK68aUkQrvSPcn1A3DLI0/KEYibSL
 T07NUjLYFcugJNpLRYOyA2oRhrN5Yz6XOqlLyfGujguLHbb+3HFst8+rveOYK2bbSlGF
 qycO77V5ORIVqXJ3o9WXJXxXx4OJDebAszpViFXpFugNQPa7rt0a9cOcZDK9ZBsZZiFo
 uKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=VD1VewVfYzcowrTTTc3p/NP2nAZZrqrdh/Y1+DTe6+o=;
 b=J6lOguamy/wfVTQAg8UfA+Uk3X6L96IJ9KJ5wE7J3g9aGui6T2C9BPkGXfLtYby0x6
 pQ0sH4j4BLXHJIuP7Ki3zFuCUNzH82FkioW2KNY1LYRyf1vpomYY+IM0tHxOhWZ/WX93
 wVcGzb2aKVlroBfMXdMENoNQ7FpBUbTG0Dof0o8hq8iu2h3F6NT20aGdRwvbaxWBUIe+
 V4qEdRB4IKLQ2pV1wYCOVjDfkZbN8ymW4Xirvme1KvKgYDM/gx62Ft6qqbQ5Ja0rJc3g
 VcmZEc7AnCBRsF9kKLHcGv/Oc60lD06x9JTB7SVKBOR8vTv+Pcd1Jl1WFVch2Hj3B3aM
 KxyQ==
X-Gm-Message-State: APjAAAXamiDfg1WJhHOCueLHz3ASfIrHP3KgAdIglOg1YsuPlfcdNJT6
 uFQh1hXlgdn4Ufmm23mbYmEkIA==
X-Google-Smtp-Source: APXvYqyZXNJxL/f6fEf8lTGkE6lao/zdKc6zFDFvbpLKofSirhqC8ULCTv5Dyqi9Xe7jEJK/Am2mwg==
X-Received: by 2002:ac8:4289:: with SMTP id o9mr173201qtl.277.1579030910016;
 Tue, 14 Jan 2020 11:41:50 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id k4sm7189056qki.35.2020.01.14.11.41.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 Jan 2020 11:41:49 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1irS4S-0006jm-U1; Tue, 14 Jan 2020 15:41:48 -0400
Date: Tue, 14 Jan 2020 15:41:48 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dennis Dalessandro <dennis.dalessandro@intel.com>
Message-ID: <20200114194148.GD22037@ziepe.ca>
References: <20200114162345.19995-1-madhuparnabhowmik04@gmail.com>
 <20200114165740.GB22037@ziepe.ca>
 <74adec84-ec5b-ea1b-7adf-3f8608838259@intel.com>
 <25133367-6544-d0af-ae30-5178909748b1@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <25133367-6544-d0af-ae30-5178909748b1@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: mike.marciniszyn@intel.com, paulmck@kernel.org, linux-rdma@vger.kernel.org,
 linux-kernel@vger.kernel.org, rcu@vger.kernel.org, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 1/3] infiniband: hw: hfi1:
 verbs.c: Use built-in RCU list checking
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

T24gVHVlLCBKYW4gMTQsIDIwMjAgYXQgMDE6MjQ6MDBQTSAtMDUwMCwgRGVubmlzIERhbGVzc2Fu
ZHJvIHdyb3RlOgo+IE9uIDEvMTQvMjAyMCAxMjowMCBQTSwgRGVubmlzIERhbGVzc2FuZHJvIHdy
b3RlOgo+ID4gT24gMS8xNC8yMDIwIDExOjU3IEFNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4g
PiA+IE9uIFR1ZSwgSmFuIDE0LCAyMDIwIGF0IDA5OjUzOjQ1UE0gKzA1MzAsCj4gPiA+IG1hZGh1
cGFybmFiaG93bWlrMDRAZ21haWwuY29tIHdyb3RlOgo+ID4gPiA+IEZyb206IE1hZGh1cGFybmEg
Qmhvd21payA8bWFkaHVwYXJuYWJob3dtaWswNEBnbWFpbC5jb20+Cj4gPiA+ID4gCj4gPiA+ID4g
bGlzdF9mb3JfZWFjaF9lbnRyeV9yY3UgaGFzIGJ1aWx0LWluIFJDVSBhbmQgbG9jayBjaGVja2lu
Zy4KPiA+ID4gPiBQYXNzIGNvbmQgYXJndW1lbnQgdG8gbGlzdF9mb3JfZWFjaF9lbnRyeV9yY3Uu
Cj4gPiA+ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTWFkaHVwYXJuYSBCaG93bWlrIDxtYWRo
dXBhcm5hYmhvd21pazA0QGdtYWlsLmNvbT4KPiA+ID4gPiDCoCBkcml2ZXJzL2luZmluaWJhbmQv
aHcvaGZpMS92ZXJicy5jIHwgMiArLQo+ID4gPiA+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gPiA+IAo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2luZmluaWJhbmQvaHcvaGZpMS92ZXJicy5jCj4gPiA+ID4gYi9kcml2ZXJzL2luZmluaWJh
bmQvaHcvaGZpMS92ZXJicy5jCj4gPiA+ID4gaW5kZXggMDg5ZTIwMWQ3NTUwLi4yMmYyZDRmZDI1
NzcgMTAwNjQ0Cj4gPiA+ID4gKysrIGIvZHJpdmVycy9pbmZpbmliYW5kL2h3L2hmaTEvdmVyYnMu
Ywo+ID4gPiA+IEBAIC01MTUsNyArNTE1LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIGhmaTFfaGFu
ZGxlX3BhY2tldChzdHJ1Y3QKPiA+ID4gPiBoZmkxX3BhY2tldCAqcGFja2V0LAo+ID4gPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvcGFfZ2V0X2xp
ZChwYWNrZXQtPmRsaWQsIDlCKSk7Cj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghbWNh
c3QpCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBkcm9wOwo+ID4gPiA+
IC3CoMKgwqDCoMKgwqDCoCBsaXN0X2Zvcl9lYWNoX2VudHJ5X3JjdShwLCAmbWNhc3QtPnFwX2xp
c3QsIGxpc3QpIHsKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAgbGlzdF9mb3JfZWFjaF9lbnRyeV9y
Y3UocCwgJm1jYXN0LT5xcF9saXN0LCBsaXN0LAo+ID4gPiA+IGxvY2tkZXBfaXNfaGVsZCgmKGli
cC0+cnZwLmxvY2spKSkgewo+ID4gPiAKPiA+ID4gT2theSwgdGhpcyBsb29rcyByZWFzb25hYmxl
Cj4gPiA+IAo+ID4gPiBNaWtlLCBEZW5uaXMsIGlzIHRoaXMgdGhlIHJpZ2h0IGxvY2sgdG8gdGVz
dD8KPiA+ID4gCj4gPiAKPiA+IEknbSBsb29raW5nIGF0IHRoYXQgcmlnaHQgbm93IGFjdHVhbGx5
LCBJIGRvbid0IHRoaW5rIHRoaXMgaXMgY29ycmVjdC4KPiA+IFdhbnRlZCB0byB0YWxrIHRvIE1p
a2UgYmVmb3JlIEkgc2VuZCBhIHJlc3BvbnNlIHRob3VnaC4KPiA+IAo+ID4gLURlbm55Cj4gCj4g
VGhhdCdzIGRlZmluaXRlbHkgZ29pbmcgdG8gdGhyb3cgYSB0b24gb2YgbG9jayBkZXAgbWVzc2Fn
ZXMuIEl0J3Mgbm90IHJlYWxseQo+IHRoZSByaWdodCBsb2NrIGVpdGhlci4gSW5zdGVhZCB3aGF0
IHdlIHByb2JhYmx5IG5lZWQgdG8gZG8gaXMgd2hhdCB3ZSBkbyBpbgo+IHRoZSBub24tbXVsdGlj
YXN0IHBhcnQgb2YgdGhlIGNvZGUgYW5kIHRha2UgdGhlIHJjdV9yZWFkX2xvY2soKS4KClVoLi4g
d2h5IGlzIHRoaXMgdXNpbmcgdGhlIF9yY3UgdmFyaWVudCB3aXRob3V0IGhvbGRpbmcgdGhlIHJj
dSBsb2NrPwpUaGF0IGlzIHF1aXRlIHdyb25nIGFscmVhZHkuCgpKYXNvbgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBt
YWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1rZXJuZWwtbWVudGVlcwo=
