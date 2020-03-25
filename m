Return-Path: <SRS0=nhK0=5K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BCE1C2D0E6
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Mar 2020 20:45:46 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36B05206F8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Mar 2020 20:45:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OkJcxH3c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36B05206F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2174C875B4;
	Wed, 25 Mar 2020 20:45:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t0HRh9dawQV3; Wed, 25 Mar 2020 20:45:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A39E3874A7;
	Wed, 25 Mar 2020 20:45:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8FF97C1D74;
	Wed, 25 Mar 2020 20:45:44 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0BFACC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 20:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EF61F86D02
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 20:45:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w1zVnh1CewLT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 20:45:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E3C2786CAC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 20:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=jeLX2eDvorNrgXxmnXUFLq3GqxHiIApgN7ztDvCeAso=; b=OkJcxH3c1qgGvhyuFVIArN7OYX
 d02hElVqTGg/qhhpLaU8hrK01yC/AhI2iFobDU6k7XGC65VzetnNv7Pcf+cFfH0b4+yjXTnOISCLA
 CNydCSXLyD+Awz2GqIjZxU9HfNSeqZssG4xZmORspOyFuAGa1oZIjCy5mMGCz/W02T5sQzkJxrS4C
 IaTIJ/pZV79z30nnWCPdcm9TpcVvFXTU/HYStGQW1apBsqpfq2oIJH9OKvFxOMtcleVQ2YFe96rAz
 fepKzeAK439dPx/IWCLXR+pBwJ3zKCRrHCpe7ZHfAxst0dPD8yGty8zVeHtPaVLDhnjdPgBobDP9I
 QfC/RHaw==;
Received: from ip5f5ad4e9.dynamic.kabel-deutschland.de ([95.90.212.233]
 helo=coco.lan)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHCuC-0003XO-F5; Wed, 25 Mar 2020 20:45:40 +0000
Date: Wed, 25 Mar 2020 21:45:36 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20200325214536.387c9494@coco.lan>
In-Reply-To: <66165ca2-1e48-2dbf-cf5b-c3b583e7d0c6@gmail.com>
References: <66165ca2-1e48-2dbf-cf5b-c3b583e7d0c6@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: linux-media@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 sean@mess.org
Subject: Re: [Linux-kernel-mentees] We should settle on a name for the new
	DVB virtual driver.
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

RW0gV2VkLCAyNSBNYXIgMjAyMCAxNzowMDozMCAtMDMwMAoiRGFuaWVsIFcuIFMuIEFsbWVpZGEi
IDxkd2xzYWxtZWlkYUBnbWFpbC5jb20+IGVzY3JldmV1OgoKPiBJdCBoYXMgY29tZSB0byBteSBh
dHRlbnRpb24gdGhhdCB0aGlzIHBhdGNowqAgLSAKPiBodHRwczovL3BhdGNod29yay5saW51eHR2
Lm9yZy9wYXRjaC82MjQ5NC/CoCAtIGhhcyByZW9yZ2FuaXplZCBhIGZldyAKPiBkaXJlY3Rvcmll
cyBpbiB0aGUgbWVkaWEgdHJlZSwgcHVzaGluZyB0ZXN0IGRyaXZlcnMgaW50byB0aGVpciBvd24g
Cj4gZGlyZWN0b3J5LgoKVHJ1ZS4gUGxlYXNlIG5vdGljZSB0aGF0IHRoaXMgd2FzIG5vdCBhcHBs
aWVkIHlldC4gSXQgbWF5IHN1ZmZlciBzb21lCmNoYW5nZXMsIGJ1dCB5ZWFoLCBpdCBtYWtlcyBz
ZW5zZSB0byBoYXZlIGEgc2VwYXJhdGUgZGlyZWN0b3J5IGZvcgp0ZXN0IGRyaXZlcnMuCgo+IElu
IGFuIGVmZm9ydCB0byByZWR1Y2UgdGhlIGFtb3VudCBvZiByZW5hbWluZyBkb3duIHRoZSBsaW5l
LCBhbmQgYWxzbyB0byAKPiBhZGFwdCB0byB0aGUgbmV3IHN0cnVjdHVyZSBwcmVzZW50ZWQgYWJv
dmUgSSB0aGluayBpdCBpcyBhIGdvb2QgdGltZSB0byAKPiBjb21lIHVwIHdpdGggYSBuYW1lIGZv
ciB0aGUgRFZCIHZpcnR1YWwgZHJpdmVyLiBJdCBtaWdodCBhbHNvIGJlIGEgZ29vZCAKPiBpZGVh
IHRvIG1vdmUgaXQgdG8gaXRzIG93biBkaXJlY3RvcnkgYXMgd2VsbCB3aGlsZSB3ZSdyZSBhdCBp
dC4KClllcywgYWdyZWVkLgoKPiBNeSBwZXJzb25hbCBwcmVmZXJlbmNlIGlzIHZpZHZiLCB3aGlj
aCBpcyBzb21ld2hhdCBpbiBsaW5lIHdpdGggdGhlIAo+IG5hbWluZyBzY2hlbWUgdXNlZCBieSBv
dGhlciB2aXJ0dWFsIGRyaXZlcnMgZm9yIHRoZSBtZWRpYSBzdWJzeXN0ZW0uCgoidmlkdmIiIHdv
cmtzIGZvciBtZSwgYnV0IG1heWJlICJ2aWR0diIgd291bGQgZXZlbiBiZSBiZXR0ZXIuCgpSZWdh
cmRzLApNYXVybwoKVGhhbmtzLApNYXVybwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgt
a2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
