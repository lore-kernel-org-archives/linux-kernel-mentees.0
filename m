Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487BAC19F2C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 Aug 2022 08:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA4594011C;
	Mon,  1 Aug 2022 08:47:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA4594011C
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=dEZ3ZGt7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IDApNyrBRynw; Mon,  1 Aug 2022 08:47:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C633B400FC;
	Mon,  1 Aug 2022 08:47:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C633B400FC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1117C0032;
	Mon,  1 Aug 2022 08:47:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14411C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 08:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0C1B4011C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 08:47:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0C1B4011C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MgnE_tJGWikz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 08:47:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F8B9400FC
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F8B9400FC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 08:47:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 117256100E;
 Mon,  1 Aug 2022 08:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2E94C433D6;
 Mon,  1 Aug 2022 08:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1659343646;
 bh=xbJSzaTJLqf/iz1sUggkR2WIMbRuPaCeSIwGgeDNNw8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dEZ3ZGt7IBgk3rFNv6L+SpJp9GAYTM2u17D05UdDWVsQpSAQ+t6TkEM/juvVJLwBT
 YlBVqOlMJN8w4yn+p5K0j4SpZDcqRQellWTl2iFQM40T2SXcZEVIJfUWs4lXMuTCb6
 CSR1l9mRovyfJWAfhe4BuHHhPoQMXSOxUhs7RnXQ=
Date: Mon, 1 Aug 2022 10:47:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH] kernel/watch_queue: Make pipe NULL while clearing
 watch_queue
Message-ID: <YueTG6Nla1pMcW/1@kroah.com>
References: <1822b768504.1d4e377e236061.5518350412857967240@siddh.me>
 <20220723135447.199557-1-code@siddh.me>
 <Ytv/4Tljvlt0PJ2r@kroah.com>
 <3558070.1658933200@warthog.procyon.org.uk>
 <182407602ce.190e58816827.7904364186178466266@siddh.me>
 <20220731181131.GB3569921@berlinger>
 <1825594fdb6.52eb2a02235647.5426665702277259900@siddh.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1825594fdb6.52eb2a02235647.5426665702277259900@siddh.me>
Cc: linux-security-modules <linux-security-module@vger.kernel.org>,
 syzbot+c70d87ac1d001f29a058
 <syzbot+c70d87ac1d001f29a058@syzkaller.appspotmail.com>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 Eric Dumazet <edumazet@google.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>,
 Marius Fleischer <fleischermarius@googlemail.com>,
 Dipanjan Das <mail.dipanjan.das@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Priyanka Bose <its.priyanka.bose@gmail.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
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

T24gTW9uLCBBdWcgMDEsIDIwMjIgYXQgMTI6MTY6NDNBTSArMDUzMCwgU2lkZGggUmFtYW4gUGFu
dCB3cm90ZToKPiBPbiBTdW4sIDMxIEp1bCAyMDIyIDIzOjQxOjMxICswNTMwICBEaXBhbmphbiBE
YXMgPG1haWwuZGlwYW5qYW4uZGFzQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiBPbiBXZWQsIEp1bCAy
NywgMjAyMiBhdCAwOTo1MDo1MlBNICswNTMwLCBTaWRkaCBSYW1hbiBQYW50IHdyb3RlOgo+ID4g
PiBUaGFuayB5b3UgZm9yIGV4cGxhaW5pbmcgaXQhCj4gPiA+IAo+ID4gPiBJIHdpbGwgc2VuZCBh
IHYzLiBTaG91bGQgSSBhZGQgYSBTdWdnZXN0ZWQtYnkgdGFnIG1lbnRpb25pbmcgeW91Pwo+ID4g
Cj4gPiBTb3JyeSBmb3IganVtcGluZyBpbi4KPiA+IAo+ID4gV2UgaGF2ZSByZXBvcnRlZCB0aGUg
c2FtZSBidWcgaW4ga2VybmVsIHY1LjEwLjEzMSBbaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
L0NBTlgyTTViSHllMlpFRWhFVjZQVWoxa1lMMktkV1llSnRnWHc4S1pSendyTnBMWXorQUBtYWls
LmdtYWlsLmNvbV0uIFdlIGhhdmUgYmVlbiBzdWdnZXN0ZWQgdG8gam9pbiB0aGlzIGRpc2N1c3Np
b24gc28gdGhhdCB3ZSBjYW4gaGF2ZSBhcHByb3ByaWF0ZSBtZXRhLWluZm9ybWF0aW9uIGluamVj
dGVkIGluIHRoaXMgcGF0Y2jigJlzIGNvbW1pdCBtZXNzYWdlIHRvIG1ha2Ugc3VyZSB0aGF0IGl0
IGdldHMgYmFja3BvcnRlZCB0byB2NS4xMC55LiAgVGhlcmVmb3JlLCB3ZSB3b3VsZCBsaWtlIHRv
IGJlIGluIHRoZSBsb29wIHNvIHRoYXQgd2UgY2FuIG9mZmVyIGhlbHAgaW4gdGhlIHByb2Nlc3Ms
IGlmIG5lZWRlZC4KPiA+IAo+IAo+IEFzIHlvdSBhcmUgc3VnZ2VzdGluZyBmb3IgYmFja3BvcnRp
bmcsIEkgc2hvdWxkIENDIHRoZSBzdGFibGUgbGlzdCwgb3IgbWFpbAo+IGFmdGVyIGl0IGdldHMg
bWVyZ2VkLiBZb3UgaGF2ZSByZXByb2R1Y2VkIGl0IG9uIHY1LjEwLCBidXQgdGhlIGNoYW5nZSBz
ZWVtcyB0bwo+IGJlIGludHJvZHVjZWQgYnkgYzczYmU2MWNlZGU1ICgicGlwZTogQWRkIGdlbmVy
YWwgbm90aWZpY2F0aW9uIHF1ZXVlIHN1cHBvcnQiKSwKPiB3aGljaCBnb3QgaW4gYXQgdjUuOC4g
U28gc2hvdWxkIGl0IGJlIGJhY2twb3J0ZWQgdGlsbCB2NS44IGluc3RlYWQ/CgpUaGVyZSBhcmUg
bm8gYWN0aXZlIHN1cHBvcnRlZCBrZXJuZWxzIG90aGVyIHRoYW4gdGhlIG9uZXMgbGlzdGVkIG9u
Cmtlcm5lbC5vcmcsIHNvIDUuOCBkb2Vzbid0IG1ha2UgbXVjaCBzZW5zZSBoZXJlLCBvbmx5IDUu
MTAgYW5kIDUuMTUgYW5kCjUuMTggYXQgdGhlIG1vbWVudC4KCnRoYW5rcywKCmdyZWcgay1oCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5l
bC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
