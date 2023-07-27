Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03921EB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Jul 2023 06:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82502408D3;
	Thu, 27 Jul 2023 06:07:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82502408D3
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JjvTkOXz
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jJLDTmXdvo5S; Thu, 27 Jul 2023 06:07:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6CA80401A1;
	Thu, 27 Jul 2023 06:07:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CA80401A1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 476BBC0072;
	Thu, 27 Jul 2023 06:07:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A625C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Jul 2023 06:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 114AA8124D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Jul 2023 06:07:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 114AA8124D
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=JjvTkOXz
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DvCYO-0J_EII
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Jul 2023 06:07:54 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 450CD811E4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Jul 2023 06:07:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 450CD811E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690438073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sKhfa5geZjKIfZjztjHk2uQ3PoNr/mdgmW/R/LWd24U=;
 b=JjvTkOXzjWsZ8pHdAEqsYUMnD47wkxIvqnnBelEjue23AIFXG1cOAI7CZPXzIuIskthQJd
 i6hTclbvyrvorSrFDIrCYVVhMojZAxlWMA9mhonNn+ULR0DWyIbsMJINAUHl/wWFLkem+7
 LjJI5K1WeQ5gXjNQSMylXnnt7/K6NvE=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-arOotJ0_OtWXxdL9W_qKmw-1; Thu, 27 Jul 2023 02:07:51 -0400
X-MC-Unique: arOotJ0_OtWXxdL9W_qKmw-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b9bb2d0b47so5040481fa.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Jul 2023 23:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690438070; x=1691042870;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sKhfa5geZjKIfZjztjHk2uQ3PoNr/mdgmW/R/LWd24U=;
 b=BY1Ze8Jf1wLyQolQj1CmDqrBLMa2XOQJ+HrW6QOeC+LMIX0oe3A1fQo0cGpDCVNByR
 vRotGBUA883jxmZGioVDu1g2UQpH+wyDu9iJkPo6hG3KY/9D8CPXfaX+Fcs+v2Dbn3Yn
 RurIKn+a1X0bKeAna49WHUFgvVrVVjCrDqDJkLUY1t5g7DvDwNBRKM0Q1SONBSSlfhSg
 nY/SIBO4CwVwPqRmomtPhncLyi37iGAjbQhRZ3cigBgMJIoN/qwZdltUzydg4gWJJsfi
 8uxgE7cy2RP2dEpsizsNASlukYoaMJ+dHxT8NjCBWP+9gsaBClFM0F9h1ZH9KIydBgTg
 MO7w==
X-Gm-Message-State: ABy/qLao5XsQqQ0MZ7c8+X+WKn0NZ+6EQayGmXf4tzZOdX2bnm0i6vBt
 v+LnBqeMPlnqUTZ/e3N8WKqrzk4yZ8Wwa+glg5l/ye6Yh6cB7Th/OrTYuqG8KwBN5hIYea4rVHs
 Jt83PBHNSpZpdwZvJnHs6sjNrEWrGw59+5KhtbCmSEjJlywNbJODdHgP/3mL2CRrl
X-Received: by 2002:a2e:3812:0:b0:2b7:3b73:2589 with SMTP id
 f18-20020a2e3812000000b002b73b732589mr895690lja.32.1690438070194; 
 Wed, 26 Jul 2023 23:07:50 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHhLW0YWxwG/nhKIg4TI3VlNVlEPvQjoVNWQ3o+mluSfSG1OIO7xuG9XQONNUkjDZfZnn1ooiv1FXY+Mm9NyQs=
X-Received: by 2002:a2e:3812:0:b0:2b7:3b73:2589 with SMTP id
 f18-20020a2e3812000000b002b73b732589mr895672lja.32.1690438069811; Wed, 26 Jul
 2023 23:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230725155403.796-1-andrew.kanner@gmail.com>
 <CACGkMEt=Cd8J995+0k=6MT1Pj=Fk9E_r2eZREptLt2osj_H-hA@mail.gmail.com>
 <ab722ec1-ae45-af1f-b869-e7339402c852@redhat.com>
 <179979e6-eb8a-0300-5445-999b9366250a@gmail.com>
 <0c06b067-349c-9fe2-2cc3-36c149fd5277@gmail.com>
In-Reply-To: <0c06b067-349c-9fe2-2cc3-36c149fd5277@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 27 Jul 2023 14:07:38 +0800
Message-ID: <CACGkMEsYzd1FphP-Ym9T9YjA9ZNBw7Mnw5xQ75dytQMJxDK3cg@mail.gmail.com>
Subject: Re: [PATCH v3] drivers: net: prevent tun_get_user() to exceed xdp
 size limits
To: David Ahern <dsahern@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: syzbot+f817490f5bd20541b90a@syzkaller.appspotmail.com,
 netdev@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>,
 Jesper Dangaard Brouer <jbrouer@redhat.com>, linux-kernel@vger.kernel.org,
 edumazet@google.com, brouer@redhat.com, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
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

T24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgODoyN+KAr0FNIERhdmlkIEFoZXJuIDxkc2FoZXJuQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiA3LzI2LzIzIDE6MzcgUE0sIERhdmlkIEFoZXJuIHdyb3Rl
Ogo+ID4gT24gNy8yNi8yMyAzOjAyIEFNLCBKZXNwZXIgRGFuZ2FhcmQgQnJvdWVyIHdyb3RlOgo+
ID4+IENjLiBKb2huIGFuZCBBaGVybgo+ID4+Cj4gPj4gT24gMjYvMDcvMjAyMyAwNC4wOSwgSmFz
b24gV2FuZyB3cm90ZToKPiA+Pj4gT24gVHVlLCBKdWwgMjUsIDIwMjMgYXQgMTE6NTTigK9QTSBB
bmRyZXcgS2FubmVyCj4gPj4+IDxhbmRyZXcua2FubmVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPj4+
Pgo+ID4+Pj4gU3l6a2FsbGVyIHJlcG9ydGVkIHRoZSBmb2xsb3dpbmcgaXNzdWU6Cj4gPj4+PiA9
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiA+Pj4+IFRvbyBCSUcgeGRw
LT5mcmFtZV9zeiA9IDEzMTA3Mgo+ID4+Cj4gPj4gSXMgdGhpcyBhIGNvbnRpZ3VvdXMgcGh5c2lj
YWwgbWVtb3J5IGFsbG9jYXRpb24/Cj4gPj4KPiA+PiAxMzEwNzIgYnl0ZXMgZXF1YWwgb3JkZXIg
NSBwYWdlLgo+ID4+Cj4gPj4gTG9va2luZyBhdCB0dW4uYyBjb2RlIEkgY2Fubm90IGZpbmQgYSBj
b2RlIHBhdGggdGhhdCBjb3VsZCBjcmVhdGUKPiA+PiBvcmRlci01IHNrYi0+ZGF0YSwgYnV0IG9u
bHkgU0tCIHdpdGggb3JkZXItMCBmcmFnbWVudHMuICBCdXQgSSBndWVzcyBpdAo+ID4+IGlzIHRo
ZSBuZXRpZl9yZWNlaXZlX2dlbmVyaWNfeGRwKCkgd2hhdCB3aWxsIHJlYWxsb2MgdG8gbWFrZSB0
aGlzIGxpbmVhcgo+ID4+ICh2aWEgc2tiX2xpbmVhcml6ZSgpKQo+ID4KPiA+Cj4gPiBnZXRfdHVu
X3VzZXIgaXMgcGFzc2VkIGFuIGlvdl9pdGVyIHdpdGggYSBzaW5nbGUgc2VnbWVudCBvZiA2NTAw
Nwo+ID4gdG90YWxfbGVuLiBUaGUgYWxsb2Nfc2tiIHBhdGggaXMgaGl0IHdpdGggYW4gYWxpZ24g
c2l6ZSBvZiBvbmx5IDY0LiBUaGF0Cj4gPiBpcyBpbnN1ZmZpY2llbnQgZm9yIFhEUCBzbyB0aGUg
bmV0aWZfcmVjZWl2ZV9nZW5lcmljX3hkcCBoaXRzIHRoZQo+ID4gcHNrYl9leHBhbmRfaGVhZCBw
YXRoLiBTb21ldGhpbmcgaXMgb2ZmIGluIHRoZSBtYXRoIGluCj4gPiBuZXRpZl9yZWNlaXZlX2dl
bmVyaWNfeGRwIHJlc3VsdGluZyBpbiB0aGUgc2tiIG1hcmtlcnMgYmVpbmcgb2ZmLiBUaGF0Cj4g
PiBjYXVzZXMgYnBmX3Byb2dfcnVuX2dlbmVyaWNfeGRwIHRvIGNvbXB1dGUgdGhlIHdyb25nIGZy
YW1lX3N6Lgo+Cj4KPiBCVFcsIGl0IGlzIHBza2JfZXhwYW5kX2hlYWQgdGhhdCB0dXJucyBpdCBm
cm9tIGEgNjRrQiB0byBhIDEyOCBrQgo+IGFsbG9jYXRpb24uIEJ1dCB0aGUgMTI4a0IgcGFydCBp
cyBub3QgcmVsZXZhbnQgdG8gdGhlICJidWciIGhlcmUgcmVhbGx5Lgo+Cj4gVGhlIHdhcm4gb24g
Z2V0dGluZyB0cmlwcGVkIGluIGJwZl94ZHBfYWRqdXN0X3RhaWwgaXMgYmVjYXVzZSB4ZHAKPiBn
ZW5lcmljIHBhdGggaXMgc2tiIGJhc2VkIGFuZCBjYW4gaGF2ZSBhIGZyYW1lX3N6ID4gNGtCLiBU
aGF0J3Mgd2hhdCB0aGUKPiBzcGxhdCBpcyBhYm91dC4KCk90aGVyIHBvc3NpYmlsaXR5OgoKdHVu
X2Nhbl9idWlsZF9za2IoKSBkb2Vzbid0IGNvdW50IFhEUF9QQUNLRVRfSEVBRFJPT00gdGhpcyBt
YXkgZW5kIHVwCndpdGggcHJvZHVjaW5nIGEgZnJhbWVfc3ogd2hpY2ggaXMgZ3JlYXRlciB0aGFu
IFBBR0VfU0laRSBhcyB3ZWxsIGluCnR1bl9idWlsZF9za2IoKS4KCkFuZCByZXRoaW5rIHRoaXMg
cGF0Y2gsIGl0IGxvb2tzIHdyb25nIHNpbmNlIGl0IGJhc2ljYWxseSBkcm9wcyBhbGwKcGFja2V0
cyB3aG9zZSBidWZsZW4gaXMgZ3JlYXRlciB0aGFuIFBBR0VfU0laRSBzaW5jZSBpdCBjYW4ndCBm
YWxsCmJhY2sgdG8gdHVuX2FsbG9jX3NrYigpLgoKPgo+IFBlcmhhcHMgdGhlIHNvbHV0aW9uIGlz
IHRvIHJlbW92ZSB0aGUgV0FSTl9PTi4KClllcywgdGhhdCBpcyB3aGF0IEknbSBhc2tpbmcgaWYg
dGhpcyB3YXJuaW5nIHN0aWxsIG1ha2VzIHNlbnNlIGluIFYxLgoKVGhhbmtzCgo+Cj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1t
ZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5k
YXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
