Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B90C001DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  3 Aug 2023 03:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DB9E821D7;
	Thu,  3 Aug 2023 03:20:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DB9E821D7
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RepakH1P
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JHbMKHjSctQo; Thu,  3 Aug 2023 03:20:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4F4828225C;
	Thu,  3 Aug 2023 03:20:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F4828225C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 200A9C0071;
	Thu,  3 Aug 2023 03:20:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD949C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 03:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DE65821D7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 03:20:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DE65821D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r_d1kT_NGjKB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 03:20:03 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 608648225C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 03:20:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 608648225C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691032801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xmkb37qJbuRIYrnthhPzfB/RS4kzPPnwHV1byRzva8o=;
 b=RepakH1PgeXbTvEtKe43IhWPsu16oB+OepPsHt3iYc4zQ3Jf1N5j+BnNk2lNUqwNl+OtvA
 OXAPhbtf0jxpOoRM/fxQOa1LeAnEJHXN+etIa0JufKVF7nN0kS5AA0VK49TKJLgZHvLEWd
 Crl93PT6oitvHmROqKkapnrtob12eKk=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-4FLYPR6HOByRyQCeAVuexg-1; Wed, 02 Aug 2023 23:20:00 -0400
X-MC-Unique: 4FLYPR6HOByRyQCeAVuexg-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-4fe1d8bd885so896804e87.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 02 Aug 2023 20:20:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691032799; x=1691637599;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xmkb37qJbuRIYrnthhPzfB/RS4kzPPnwHV1byRzva8o=;
 b=UeNidE0W+3kEjsBlXzjuzPXJBux7pX/sEdW2croqgmby3WobuX5jVtWjkuBEVCRSmT
 /x2lsQb7aFQdcGo+HBmHPPWDoAgj+it2wGimxG9qmyauC0ordxr5KO20eia/XYI2DeVY
 yUWLvJ2J/e3Ke4DbH56W/FI0shX+gxR7HIx4G1c7DUpAJ4u2jHKsgVtjFUOrgG7MTXIw
 6A+qFphR5ZJIJQclPh5qyxIysZiorsoubygUZjG12OFRNue+1let+vGc64WSUOSSYwDP
 GMjAW1W3jnPCU+2Fj5QK+f09yg10oFNlEHaBQM6BrIIJwxk9YIPLzTgb6GRzJ2NHROZ1
 bonA==
X-Gm-Message-State: ABy/qLajB7OtDDxgFlA6udt4K1/XDOrRQRiEWytvYmkGPHjA4VZ3cFHE
 k9ZcXuwZIewYZY0jBkgt19wEYZ0V5OI28vpiD4SJh+kQnoUbx5poXuidBCCrOv6NyH5EePf+at3
 G7GPwo7T8ASmHMDk+VedM4LXzaK+r9Zuvs+WG6KgeB5GCvXMHzMUhXsiEnGaveNHy
X-Received: by 2002:a05:6512:318d:b0:4fe:2528:8c69 with SMTP id
 i13-20020a056512318d00b004fe25288c69mr2854972lfe.17.1691032798913; 
 Wed, 02 Aug 2023 20:19:58 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF/2NgzaADWkLGGauovzd/v5mfkcrtS8swlvzvX+94eAhVV/HxU7ilWql2b4M4tl1XuQseOwoaGVVK03x5KOcc=
X-Received: by 2002:a05:6512:318d:b0:4fe:2528:8c69 with SMTP id
 i13-20020a056512318d00b004fe25288c69mr2854958lfe.17.1691032798530; Wed, 02
 Aug 2023 20:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230801220710.464-1-andrew.kanner@gmail.com>
 <2cb34364-0d7c-cf0a-487f-c15ba6568ac8@kernel.org>
In-Reply-To: <2cb34364-0d7c-cf0a-487f-c15ba6568ac8@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 3 Aug 2023 11:19:47 +0800
Message-ID: <CACGkMEvukuV5UZqb=MOaPqWfuJKOokZW1986GE4cRwt=Vx9Unw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] drivers: net: prevent tun_build_skb() to exceed
 the packet size limit
To: Jesper Dangaard Brouer <hawk@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: syzbot+f817490f5bd20541b90a@syzkaller.appspotmail.com,
 netdev@vger.kernel.org, john.fastabend@gmail.com, edumazet@google.com,
 jbrouer@redhat.com, linux-kernel@vger.kernel.org, dsahern@gmail.com,
 kuba@kernel.org, pabeni@redhat.com,
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

T24gV2VkLCBBdWcgMiwgMjAyMyBhdCAxMDoxNOKAr1BNIEplc3BlciBEYW5nYWFyZCBCcm91ZXIg
PGhhd2tAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPgo+Cj4gT24gMDIvMDgvMjAyMyAwMC4wNywgQW5k
cmV3IEthbm5lciB3cm90ZToKPiA+IFVzaW5nIHRoZSBzeXprYWxsZXIgcmVwcm8gd2l0aCByZWR1
Y2VkIHBhY2tldCBzaXplIGl0IHdhcyBkaXNjb3ZlcmVkCj4gPiB0aGF0IFhEUF9QQUNLRVRfSEVB
RFJPT00gaXMgbm90IGNoZWNrZWQgaW4gdHVuX2Nhbl9idWlsZF9za2IoKSwKPiA+IGFsdGhvdWdo
IHBhZCBtYXkgYmUgaW5jcmVtZW50ZWQgaW4gdHVuX2J1aWxkX3NrYigpLiBUaGlzIG1heSBlbmQg
dXAKPiA+IHdpdGggZXhjZWVkaW5nIHRoZSBQQUdFX1NJWkUgbGltaXQgaW4gdHVuX2J1aWxkX3Nr
YigpLgo+ID4KPiA+IEZpeGVzOiA3ZGYxMzIxOWQ3NTcgKCJ0dW46IHJlc2VydmUgZXh0cmEgaGVh
ZHJvb20gb25seSB3aGVuIFhEUCBpcyBzZXQiKQo+ID4gTGluazogaHR0cHM6Ly9zeXprYWxsZXIu
YXBwc3BvdC5jb20vYnVnP2V4dGlkPWY4MTc0OTBmNWJkMjA1NDFiOTBhCj4gPiBTaWduZWQtb2Zm
LWJ5OiBBbmRyZXcgS2FubmVyIDxhbmRyZXcua2FubmVyQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4K
PiA+IE5vdGVzOgo+ID4gICAgICB2MyAtPiB2NDoKPiA+ICAgICAgKiBmYWxsIGJhY2sgdG8gdjEs
IGZpeGluZyBvbmx5IG1pc3NpbmcgWERQX1BBQ0tFVF9IRUFEUk9PTSBpbiBwYWQgYW5kCj4gPiAg
ICAgICAgcmVtb3ZpbmcgYnBmX3hkcF9hZGp1c3RfdGFpbCgpIGNoZWNrIGZvciBmcmFtZV9zei4K
PiA+ICAgICAgKiBhZGRlZCByY3UgcmVhZCBsb2NrLCBub3RlZCBieSBKYXNvbiBXYW5nIDxqYXNv
d2FuZ0ByZWRoYXQuY29tPiBpbiB2MQo+ID4gICAgICAqIEkgZGVjaWRlZCB0byBsZWF2ZSB0aGUg
cGFja2V0IGxlbmd0aCBjaGVjayBpbiB0dW5fY2FuX2J1aWxkX3NrYigpCj4gPiAgICAgICAgaW5z
dGVhZCBvZiBtb3ZpbmcgdG8gdHVuX2J1aWxkX3NrYigpIHN1Z2dlc3RlZCBieSBKYXNvbiBXYW5n
Cj4gPiAgICAgICAgPGphc293YW5nQHJlZGhhdC5jb20+LiBPdGhlcndpc2UgZXh0cmEgcGFja2V0
cyB3aWxsIGJlIGRyb3BwZWQKPiA+ICAgICAgICB3aXRob3V0IGZhbGxpbmcgYmFjayB0byB0dW5f
YWxsb2Nfc2tiKCkuIEFuZCBpbiB0aGUgZGlzY3Vzc2lvbiBvZiB2Mwo+ID4gICAgICAgIEplc3Bl
ciBEYW5nYWFyZCBCcm91ZXIgPGpicm91ZXJAcmVkaGF0LmNvbT4gbm90aWNlZCB0aGF0IFhEUCBp
cyBvawo+ID4gICAgICAgIHdpdGggYSBoaWdoZXIgb3JkZXIgcGFnZXMgaWYgaXQncyBhIGNvbnRp
Z3VvdXMgcGh5c2ljYWwgbWVtb3J5Cj4gPiAgICAgICAgYWxsb2NhdGlvbiwgc28gZmFsbGluZyB0
byB0dW5fYWxsb2Nfc2tiKCkgLT4gZG9feGRwX2dlbmVyaWMoKSBzaG91bGQKPiA+ICAgICAgICBi
ZSBvay4KPiA+Cj4gPiAgICAgIHYyIC0+IHYzOgo+ID4gICAgICAqIGF0dGFjaCB0aGUgZm9yZ290
dGVuIGNoYW5nZWxvZwo+ID4KPiA+ICAgICAgdjEgLT4gdjI6Cj4gPiAgICAgICogbWVyZ2VkIDIg
cGF0Y2hlcyBpbiAxLCBmaXhpbmcgYm90aCBpc3N1ZXM6IFdBUk5fT05fT05DRSB3aXRoCj4gPiAg
ICAgICAgc3l6a2FsbGVyIHJlcHJvIGFuZCBtaXNzaW5nIFhEUF9QQUNLRVRfSEVBRFJPT00gaW4g
cGFkCj4gPiAgICAgICogY2hhbmdlZCB0aGUgdGl0bGUgYW5kIGRlc2NyaXB0aW9uIG9mIHRoZSBl
eGVjdXRpb24gcGF0aCwgc3VnZ2VzdGVkCj4gPiAgICAgICAgYnkgSmFzb24gV2FuZyA8amFzb3dh
bmdAcmVkaGF0LmNvbT4KPiA+ICAgICAgKiBtb3ZlIHRoZSBsaW1pdCBjaGVjayBmcm9tIHR1bl9j
YW5fYnVpbGRfc2tiKCkgdG8gdHVuX2J1aWxkX3NrYigpIHRvCj4gPiAgICAgICAgcmVtb3ZlIGR1
cGxpY2F0aW9uIGFuZCBsb2NraW5nIGlzc3VlLCBhbmQgYWxzbyBkcm9wIHRoZSBwYWNrZXQgaW4K
PiA+ICAgICAgICBjYXNlIG9mIGEgZmFpbGVkIGNoZWNrIC0gbm90ZWQgYnkgSmFzb24gV2FuZyA8
amFzb3dhbmdAcmVkaGF0LmNvbT4KPiA+Cj4gPiAgIGRyaXZlcnMvbmV0L3R1bi5jIHwgMTEgKysr
KysrKysrKy0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvdHVuLmMgYi9kcml2ZXJzL25l
dC90dW4uYwo+ID4gaW5kZXggZDc1NDU2YWRjNjJhLi5hMWQwNGJjOTQ4NWYgMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL25ldC90dW4uYwo+ID4gKysrIGIvZHJpdmVycy9uZXQvdHVuLmMKPiA+IEBA
IC0xNTgyLDYgKzE1ODIsOSBAQCBzdGF0aWMgdm9pZCB0dW5fcnhfYmF0Y2hlZChzdHJ1Y3QgdHVu
X3N0cnVjdCAqdHVuLCBzdHJ1Y3QgdHVuX2ZpbGUgKnRmaWxlLAo+ID4gICBzdGF0aWMgYm9vbCB0
dW5fY2FuX2J1aWxkX3NrYihzdHJ1Y3QgdHVuX3N0cnVjdCAqdHVuLCBzdHJ1Y3QgdHVuX2ZpbGUg
KnRmaWxlLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBsZW4sIGludCBub2Js
b2NrLCBib29sIHplcm9jb3B5KQo+ID4gICB7Cj4gPiArICAgICBzdHJ1Y3QgYnBmX3Byb2cgKnhk
cF9wcm9nOwo+ID4gKyAgICAgaW50IHBhZCA9IFRVTl9SWF9QQUQ7Cj4gPiArCj4gPiAgICAgICBp
ZiAoKHR1bi0+ZmxhZ3MgJiBUVU5fVFlQRV9NQVNLKSAhPSBJRkZfVEFQKQo+ID4gICAgICAgICAg
ICAgICByZXR1cm4gZmFsc2U7Cj4gPgo+ID4gQEAgLTE1OTQsNyArMTU5NywxMyBAQCBzdGF0aWMg
Ym9vbCB0dW5fY2FuX2J1aWxkX3NrYihzdHJ1Y3QgdHVuX3N0cnVjdCAqdHVuLCBzdHJ1Y3QgdHVu
X2ZpbGUgKnRmaWxlLAo+ID4gICAgICAgaWYgKHplcm9jb3B5KQo+ID4gICAgICAgICAgICAgICBy
ZXR1cm4gZmFsc2U7Cj4gPgo+ID4gLSAgICAgaWYgKFNLQl9EQVRBX0FMSUdOKGxlbiArIFRVTl9S
WF9QQUQpICsKPiA+ICsgICAgIHJjdV9yZWFkX2xvY2soKTsKPiA+ICsgICAgIHhkcF9wcm9nID0g
cmN1X2RlcmVmZXJlbmNlKHR1bi0+eGRwX3Byb2cpOwo+ID4gKyAgICAgaWYgKHhkcF9wcm9nKQo+
ID4gKyAgICAgICAgICAgICBwYWQgKz0gWERQX1BBQ0tFVF9IRUFEUk9PTTsKPiA+ICsgICAgIHJj
dV9yZWFkX3VubG9jaygpOwo+ID4gKwo+Cj4gSXNvbGF0ZWQgc2VlbiwgSSBndWVzcywgdGhpcyBp
cyBhIGNvcnJlY3QgZml4IHRvIDdkZjEzMjE5ZDc1Ny4KCkkgdGhpbmsgc28uCgpBY3R1YWxseSwg
SSB0aGluayB3ZSBjYW4gcHJvYmFibHkgYWx3YXlzIGNvdW50IFhEUF9QQUNLRVRfSEVBRFJPT00K
aGVyZS4gU2luY2UgdGhlcmUncyBhIHdpbmRvdyB0aGF0IFhEUCBwcm9ncmFtIG1pZ2h0IGJlIGF0
dGFjaGVkIGluIHRoZQptaWRkbGUgb2YgdHVuX2Nhbl9idWlsZF9za2IoKSBhbmQgdHVuX2J1aWxk
X3NrYigpLgoKPgo+ID4gKyAgICAgaWYgKFNLQl9EQVRBX0FMSUdOKGxlbiArIHBhZCkgKwo+ID4g
ICAgICAgICAgIFNLQl9EQVRBX0FMSUdOKHNpemVvZihzdHJ1Y3Qgc2tiX3NoYXJlZF9pbmZvKSkg
PiBQQUdFX1NJWkUpCj4gPiAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+Cj4KPiBRdWVz
dGlvbiB0byBKYXNvbiBXYW5nOgo+IFdoeSBmYWxsIGJhY2sgKHRvIGUuZy4gdHVuX2FsbG9jX3Nr
YigpKSB3aGVuIHNpemUgaXMgYWJvdmUgUEFHRV9TSVpFPwo+Cj4gQUZBSUsgdHVuX2J1aWxkX3Nr
YigpICpjYW4qIGNyZWF0ZSBnZXQgbGFyZ2VyIHBhY2tldHMgdGhhbiBQQUdFX1NJWkUKPiBmcm9t
IGl0J3MgcGFnZV9mcmFnLiAgSXMgdGhlcmUgYSByZWFzb24gZm9yIHRoaXMgbGltaXRhdGlvbj8K
CkkgY291bGRuJ3QgcmVjYWxsIGJ1dCBJIHRoaW5rIHdlIGNhbiByZWxheC4KClRoYW5rcwoKPgo+
IChUbyBBbmRyZXcsIEkgYXNzdW1lIGEgY2hhbmdlIGluIHRoaXMgYXJlYSBpcyBhbm90aGVyIHBh
dGNoKS4KPgo+IC0tSmVzcGVyCj4KPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgt
a2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
