Return-Path: <SRS0=142Q=KC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81395C433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  7 May 2021 12:17:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04334613C9
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  7 May 2021 12:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04334613C9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3BA740FAF;
	Fri,  7 May 2021 12:17:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id siWrtvFxnyPV; Fri,  7 May 2021 12:17:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 778E540F96;
	Fri,  7 May 2021 12:17:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5531DC000D;
	Fri,  7 May 2021 12:17:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96EAEC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 May 2021 12:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 856B8843B9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 May 2021 12:17:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WOdX-2BtZpur
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 May 2021 12:17:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBDE483E17
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 May 2021 12:17:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 52F136100C;
 Fri,  7 May 2021 12:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1620389820;
 bh=kAX2q89zUtg6sddYFznN3zI0usUIbWNAgbcEr0LdgvY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dIh4wS9Hf68ZridKp3QQ+6CswDF7lqGkm/LgDp5KYMHEUl6Miv1rpxCz41sOWurl6
 llgRXoYMhIlGKMTxnTM3o+O4pfSDsUR/apxe2/RTdAQDhOv+tRI02zA4/E9VDoeUZo
 SkLUZv5PzaasJOvguVe/lrbC30Aw52z92ITjbOzs=
Date: Fri, 7 May 2021 14:16:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Anirudh Rayabharam <mail@anirudhrb.com>
Subject: Re: [PATCH v2] rapidio: fix unused variable warning in rio_cm.c
Message-ID: <YJUvuEYDbAWUb27y@kroah.com>
References: <20210506181837.4758-1-mail@anirudhrb.com>
 <YJTgmXwZyOgFPIHf@kroah.com> <YJUtHCSm//0PlyYf@anirudhrb.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJUtHCSm//0PlyYf@anirudhrb.com>
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

T24gRnJpLCBNYXkgMDcsIDIwMjEgYXQgMDU6MzU6NDhQTSArMDUzMCwgQW5pcnVkaCBSYXlhYmhh
cmFtIHdyb3RlOgo+IE9uIEZyaSwgTWF5IDA3LCAyMDIxIGF0IDA4OjM5OjIxQU0gKzAyMDAsIEdy
ZWcgS0ggd3JvdGU6Cj4gPiBPbiBUaHUsIE1heSAwNiwgMjAyMSBhdCAxMTo0ODozNlBNICswNTMw
LCBBbmlydWRoIFJheWFiaGFyYW0gd3JvdGU6Cj4gPiA+IEdDQyBwcm9kdWNlcyBhbiB1bnVzZWQg
dmFyaWFibGUgd2FybmluZyBmb3IgJ3JjJzoKPiA+ID4gCj4gPiA+IAlkcml2ZXJzL3JhcGlkaW8v
cmlvX2NtLmM6IEluIGZ1bmN0aW9uIOKAmHJpb190eGNxX2hhbmRsZXLigJk6Cj4gPiA+IAlkcml2
ZXJzL3JhcGlkaW8vcmlvX2NtLmM6NjczOjc6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHJj4oCZIHNl
dCBidXQKPiA+ID4gCW5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+ID4gPiAK
PiA+ID4gVGhlIHJldHVybiB2YWx1ZSBvZiByaW9fYWRkX291dGJfbWVzc2FnZSgpIGlzIGFzc2ln
bmVkIHRvICdyYycgYnV0IGl0Cj4gPiA+IGlzIG5ldmVyIHVzZWQuIEZpeCB0aGlzIHdhcm5pbmcg
YnkgbG9nZ2luZyBhbiBlcnJvciBpZiAncmMnIGlzIG5vbi16ZXJvLgo+ID4gPiAKPiA+ID4gU2ln
bmVkLW9mZi1ieTogQW5pcnVkaCBSYXlhYmhhcmFtIDxtYWlsQGFuaXJ1ZGhyYi5jb20+Cj4gPiA+
IC0tLQo+ID4gPiAKPiA+ID4gQ2hhbmdlcyBpbiB2MjoKPiA+ID4gTG9nIGFuIGVycm9yIGluc3Rl
YWQgb2YganVzdCByZW1vdmluZyAncmMnLgo+ID4gPiAKPiA+ID4gdjE6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xrbWwvMjAyMTA1MDEwNTUwMTguOTI0NC0xLW1haWxAYW5pcnVkaHJiLmNvbS8K
PiA+ID4gCj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9yYXBpZGlvL3Jpb19jbS5jIHwgNSArKysr
Kwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+ID4gPiAKPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvcmFwaWRpby9yaW9fY20uYyBiL2RyaXZlcnMvcmFwaWRpby9yaW9f
Y20uYwo+ID4gPiBpbmRleCA1MGVjNTNkNjdhNGMuLjk3MWEzNmYxYTIzYSAxMDA2NDQKPiA+ID4g
LS0tIGEvZHJpdmVycy9yYXBpZGlvL3Jpb19jbS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvcmFwaWRp
by9yaW9fY20uYwo+ID4gPiBAQCAtNjc3LDYgKzY3NywxMSBAQCBzdGF0aWMgdm9pZCByaW9fdHhj
cV9oYW5kbGVyKHN0cnVjdCBjbV9kZXYgKmNtLCBpbnQgc2xvdCkKPiA+ID4gIAkJCWNtLT50eF9i
dWZbY20tPnR4X3Nsb3RdID0gcmVxLT5idWZmZXI7Cj4gPiA+ICAJCQlyYyA9IHJpb19hZGRfb3V0
Yl9tZXNzYWdlKGNtLT5tcG9ydCwgcmVxLT5yZGV2LCBjbWJveCwKPiA+ID4gIAkJCQkJCSAgcmVx
LT5idWZmZXIsIHJlcS0+bGVuKTsKPiA+ID4gKwkJCWlmIChyYykgewo+ID4gPiArCQkJCXJpb2Nt
X2Vycm9yKCJGYWlsZWQgdG8gYWRkIG1zZyB0byB0eCBxdWV1ZSAoZXJyPSVkKSIsCj4gPiA+ICsJ
CQkJCQlyYyk7Cj4gPiAKPiA+IFRoYXQncyBwcmV0dHkgcG9pbnRsZXNzIChhbmQgbm8gbmVlZCBm
b3Ige30pLgo+IAo+IFRoZSBwb2ludCBpcyB0aGF0IHRoaXMgZml4ZXMgdGhlIGNvbXBpbGVyIHdh
cm5pbmcuCgpEb24ndCBibGluZGx5IGZpeCB3YXJuaW5ncyBpbiB3YXlzIHRvIGp1c3Qgc2h1dCBh
IGNvbXBpbGVyIHVwLiAgRml4IHRoZQppc3N1ZSBjb3JyZWN0bHkgcGxlYXNlLgoKPiA+IElmIGFu
IGVycm9yIGhhcHBlbnMsIHByb3Blcmx5IHJlY292ZXIgZnJvbSBpdCwgZG9uJ3QganVzdCBwdW50
IGFuZCB0ZWxsCj4gPiB0aGUgdXNlciBzb21ldGhpbmcgYmFkIGhhcHBlbmVkIGFuZCB0aGVuIGln
bm9yZSBpdC4KPiAKPiBUaGUgcHJpbWFyeSBtb3RpdmF0aW9uIGJlaGluZCB0aGlzIHBhdGNoIGlz
IHRvIGZpeCB0aGUgY29tcGlsZXIgd2FybmluZy4KPiBUaGlzIGVycm9yIGlzIGlnbm9yZWQgZXZl
biBpbiB0aGUgY3VycmVudCB0cmVlLiBNeSBwYXRjaCBhdCBsZWFzdCBsb2dzIGl0Cj4gc28gdGhh
dCBwZW9wbGUga25vdyB0aGF0IGl0J3MgaGFwcGVuaW5nLiBBbmQgb25jZSB0aGV5IGtub3cgdGhh
dCBpdCdzCj4gaGFwcGVuaW5nIGFuZCBzb21lb25lIHdhbnRzIHRvIHByb3BhZ2F0ZSB0aGUgZXJy
b3IgY29kZSB0byB1c2Vyc3BhY2Ugb3IKPiBoYW5kbGUgaXQgZGlmZmVyZW50bHkgdGhleSBjYW4g
d3JpdGUgYSBwYXRjaCB0byBkbyBzby4KClBsZWFzZSB3cml0ZSB0aGF0IHBhdGNoLCBhcy1pcywg
dGhpcyBjaGFuZ2UgaXMgcG9pbnRsZXNzLgoKdGhhbmtzLAoKZ3JlZyBrLWgKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMg
bWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgta2VybmVsLW1lbnRlZXMK
