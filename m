Return-Path: <SRS0=QZ3P=DR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A853C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 19:20:31 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF65A22267
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 19:20:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="u1uXILE4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF65A22267
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9AA9487535;
	Sat, 10 Oct 2020 19:20:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zrjbMbSbYTvM; Sat, 10 Oct 2020 19:20:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E8BB587363;
	Sat, 10 Oct 2020 19:20:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CBC46C016F;
	Sat, 10 Oct 2020 19:20:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D25F0C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 19:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C0A0586CD0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 19:20:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M2P1bFYCo0yV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 19:20:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 49F1B86CB3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 19:20:27 +0000 (UTC)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D56B22258;
 Sat, 10 Oct 2020 19:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602357626;
 bh=1rFFenx5YaOoyjN6AOp5kOMJV7iSmN0ey8iVvvT9Ck0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=u1uXILE4wH+0QAJm6IeD5VwS/QkS3cEJnyAbweMQ2CZGsWfc1JVZHAL9qTYl/K+Fa
 ZBu/bchAgrF/5CmgDG3BM/ajQaUBEbepcDnZGCLlSAZtSQpTg2f8wpmeJOsqKXixhy
 cRBEorT0By3F6D1EY3DuANtfFgrE53GazWxPUNTc=
Date: Sat, 10 Oct 2020 12:20:24 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <20201010122024.0ec7c2f1@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <e772b9f0-f5cd-c50b-86a7-fde22b6e13e3@gmail.com>
References: <20201010064459.6563-1-anant.thazhemadam@gmail.com>
 <20201010095302.5309c118@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <0de8e509-7ca5-7faf-70bf-5880ce0fc15c@gmail.com>
 <20201010111645.334647af@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <e772b9f0-f5cd-c50b-86a7-fde22b6e13e3@gmail.com>
MIME-Version: 1.0
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Petko Manolov <petkan@nucleusys.com>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH] net: usb: rtl8150: don't
 incorrectly assign random MAC addresses
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

T24gU3VuLCAxMSBPY3QgMjAyMCAwMDoxNDowNSArMDUzMCBBbmFudCBUaGF6aGVtYWRhbSB3cm90
ZToKPiBBaCwgbXkgYXBvbG9naWVzLiBZb3UncmUgcmlnaHQuIEl0IGRvZXNuJ3QgbG9vayBsaWtl
IHRob3NlIGhlbHBlcnMgaGF2ZSBtYWRlCj4gdGhlaXIgd2F5IGludG8gdGhlIG5ldHdvcmtpbmcg
dHJlZSB5ZXQuCj4gCj4gKFRoaXMgZ2V0cyBtZW50aW9uZWQgaGVyZSBhcyB3ZWxsLAo+IMKgwqDC
oCBodHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29tL25ldGRldkB2Z2VyLmtlcm5lbC5vcmcvbXNn
MzU3ODQzLmh0bWwpCj4gCj4gVGhlIGNvbW1pdCBJRCBwb2ludGVkIHRvIGJ5IHRoZSBmaXhlcyB0
YWcgaXMgY29ycmVjdC4KPiBUaGUgY2hhbmdlIGludHJvZHVjZWQgYnkgc2FpZCBjb21taXQgbG9v
a3MgcmlnaHQsIGJ1dCBpcyBsb2dpY2FsbHkgaW5jb3JyZWN0Lgo+IAo+IGdldF9yZWdpc3RlcnMo
KSBkaXJlY3RseSByZXR1cm5zIHRoZSByZXR1cm4gdmFsdWUgb2YgdXNiX2NvbnRyb2xfbXNnX3Jl
Y3YoKSwKPiBhbmQgdXNiX2NvbnRyb2xfbXNnX3JlY3YoKSByZXR1cm5zIDAgb24gc3VjY2VzcyBh
bmQgbmVnYXRpdmUgZXJyb3IgbnVtYmVyCj4gb3RoZXJ3aXNlLgo+IAo+IChZb3UgY2FuIGZpbmQg
bW9yZSBhYm91dCB0aGUgbmV3IGhlbHBlcnMgaGVyZQo+IMKgwqDCoCBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbHNhLWRldmVsLzIwMjAwOTE0MTUzNzU2LjM0MTIxNTYtMS1ncmVna2hAbGludXhm
b3VuZGF0aW9uLm9yZy8gKQo+IAo+IFRoZSBjb21taXQgSUQgbWVudGlvbmVkIGludHJvZHVjZXMg
YSBjaGFuZ2UgdGhhdCBpcyBzdXBwb3NlZCB0byBjb3B5IG92ZXIKPiB0aGUgZXRoZXJuZXQgb25s
eSB3aGVuIGdldF9yZWdpc3RlcnMoKSBzdWNjZWVkcywgaS5lLiwgYSBjb21wbGV0ZSByZWFkIG9j
Y3VycywKPiBhbmQgZ2VuZXJhdGUgYW5kIHNldCBhIHJhbmRvbSBldGhlcm5ldCBhZGRyZXNzIG90
aGVyd2lzZSAocmVhZGluZyB0aGUKPiBjb21taXQgbWVzc2FnZSBzaG91bGQgZ2l2ZSBzb21lIG1v
cmUgaW5zaWdodCkuCj4gCj4gVGhlIGNvbmRpdGlvbiB0aGF0IGNoZWNrcyBpZiBnZXRfcmVnaXN0
ZXJzKCkgc3VjY2VlZHMgKGFzIHNwZWNpZmllZCBpbiBmNDVhNDI0OGVhNGMpCj4gd2FzLAo+IMKg
wqDCoCByZXQgPT0gc2l6ZW9mKG5vZGVfaWQpCj4gd2hlcmUgcmV0IGlzIHRoZSByZXR1cm4gdmFs
dWUgb2YgZ2V0X3JlZ2lzdGVycygpLgo+IAo+IEhvd2V2ZXIsIHJldCB3aWxsIG5ldmVyIGVxdWFs
IHNpemVvZihub2RlX2lkKSwgc2luY2UgcmV0IGNhbiBvbmx5IGJlIGVxdWFsIHRvIDAKPiBvciBh
IG5lZ2F0aXZlIG51bWJlci4KPiAKPiBUaHVzLCBldmVuIGluIGNhc2Ugd2hlcmUgZ2V0X3JlZ2lz
dGVycygpIHN1Y2NlZWRzLCBhIHJhbmRvbWx5IGdlbmVyYXRlZCBNQUMKPiBhZGRyZXNzIHdvdWxk
IGdldCBjb3BpZWQgb3ZlciwgaW5zdGVhZCBvZiBjb3B5aW5nIHRoZSBhcHByb3ByaWF0ZSBldGhl
cm5ldAo+IGFkZHJlc3MsIHdoaWNoIGlzIGxvZ2ljYWxseSBpbmNvcnJlY3QgYW5kIG5vdCBvcHRp
bWFsLgo+IAo+IEhlbmNlLCB3ZSBuZWVkIHRvIG1vZGlmeSB0aGlzIHRvIGNoZWNrIGlmIChyZXQg
PT0gMCksIGFuZCBjb3B5IG92ZXIgdGhlIGNvcnJlY3QKPiBldGhlcm5ldCBhZGRyZXNzIGluIHRo
YXQgY2FzZSwgaW5zdGVhZCBvZiByYW5kb21seSBnZW5lcmF0aW5nIG9uZSBhbmQgYXNzaWduaW5n
Cj4gdGhhdC4KCkkgc2VlLi4uIHNvIHdlIGVuZGVkIHVwIHdpdGggeW91ciBmaXggYXBwbGllZCB0
byBuZXQsIGFuZCBQZXRrbydzCnJld29yayBhcHBsaWVkIHRvIHRoZSB1c2IvdXNiLW5leHQgdHJl
ZS4KCldoYXQgeW91J3JlIGFjdHVhbGx5IGZpeGluZyBpcyB0aGUgaW1wcm9wZXIgcmVzb2x1dGlv
biBvZiB0aGUgcmVzdWx0aW5nCmNvbmZsaWN0IGluIGxpbnV4LW5leHQhCgpDQ2luZyBTdGVwaGVu
IGFuZCBsaW51eC1uZXh0LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1l
bnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
