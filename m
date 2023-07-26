Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4D6EB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 26 Jul 2023 02:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4120140B16;
	Wed, 26 Jul 2023 02:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4120140B16
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fZOgCJbp
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E3Ere3Fm-1tX; Wed, 26 Jul 2023 02:10:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id F3587400AC;
	Wed, 26 Jul 2023 02:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3587400AC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D26FFC0072;
	Wed, 26 Jul 2023 02:10:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1B7B8C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Jul 2023 02:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF93540179
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Jul 2023 02:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF93540179
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WM5Loq_rw4JY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Jul 2023 02:10:08 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BFE67400AC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Jul 2023 02:10:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFE67400AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690337407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i7bDIq1bzY465BO1ikbOzMcgPMOtP/SRoAEj7PnPWEQ=;
 b=fZOgCJbpImPyXEpNKAn5OlLEpeaOdYdfho6V05n9UVM5S+6DJZWvktjtnOt+5LmSXVRowQ
 FvdpQNdhL33PC5A04SPjVoLH5UVQ5quVoajVp9dm82d1rYltqgndY3wTbFnCQie8DS2YpO
 WVySq3qEUGSX6IEXrqyZ6cypOl5dK9k=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-TQJA0buUM1q6IXgsSRuxkg-1; Tue, 25 Jul 2023 22:10:06 -0400
X-MC-Unique: TQJA0buUM1q6IXgsSRuxkg-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2b9b50be2ccso1702621fa.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Jul 2023 19:10:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690337405; x=1690942205;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i7bDIq1bzY465BO1ikbOzMcgPMOtP/SRoAEj7PnPWEQ=;
 b=Fw5ZsgfpXuVdHR7rS4+fRA68T6Um1wHtCtn88jLAS5yZv9WLAAW4OnU2vYIAbzKNDU
 +hwizb1uBKgadTp6Yg0TRIstjKiw+PoYRRaBvNPXqU+ffJFViMkZd+UlFAcQqoeKAWbH
 +vgBV7GODRl29IBS0CrX6Sf7d+lJdQr5W1tO5qFW+TdRErZuvTYHNx2S6RxDNBWRU92t
 Q0fjO1achQOb8DRLZ37amt1iXav1DzpUEHw5Mnd53iw7bxod64roNs2qUCDS2wRMMtC+
 i65RbhcY9tsiVLBfeVUj/gYrDyIhg25XPfnvAW2uxuYvMXxlbIhZ2A+4LauHk6KapUs0
 4JsA==
X-Gm-Message-State: ABy/qLaRSalU8ktBTN0jTCtDsrsmwOKMSG+l6LMfdlbqIBKEijw3CsF1
 eosC+fwXc05fkGOQ2O6I/uDSkZVKtD+8CcR/dXi55es/S2JerttJyTEQkhwHwsG+xTGFF0Lb23R
 y5ovWBs4aiCXKaJffoYdz7IfrphRcB94E20jaxHe3Dx5sOXeQd48/GbTQ0vjP3mUx
X-Received: by 2002:a2e:740c:0:b0:2b6:df15:f6c3 with SMTP id
 p12-20020a2e740c000000b002b6df15f6c3mr421208ljc.39.1690337404997; 
 Tue, 25 Jul 2023 19:10:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH5n0NZmMcxmIedZTS/miupPMCrGyzDqyGwVRWakUfxzh5EJlfkOl2hIJP2qoGZ5X8BPBLEKYFInjxlohQV8V4=
X-Received: by 2002:a2e:740c:0:b0:2b6:df15:f6c3 with SMTP id
 p12-20020a2e740c000000b002b6df15f6c3mr421200ljc.39.1690337404691; Tue, 25 Jul
 2023 19:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230725155403.796-1-andrew.kanner@gmail.com>
In-Reply-To: <20230725155403.796-1-andrew.kanner@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 26 Jul 2023 10:09:53 +0800
Message-ID: <CACGkMEt=Cd8J995+0k=6MT1Pj=Fk9E_r2eZREptLt2osj_H-hA@mail.gmail.com>
Subject: Re: [PATCH v3] drivers: net: prevent tun_get_user() to exceed xdp
 size limits
To: Andrew Kanner <andrew.kanner@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: syzbot+f817490f5bd20541b90a@syzkaller.appspotmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, edumazet@google.com,
 brouer@redhat.com, kuba@kernel.org, pabeni@redhat.com,
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

T24gVHVlLCBKdWwgMjUsIDIwMjMgYXQgMTE6NTTigK9QTSBBbmRyZXcgS2FubmVyIDxhbmRyZXcu
a2FubmVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBTeXprYWxsZXIgcmVwb3J0ZWQgdGhlIGZvbGxv
d2luZyBpc3N1ZToKPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiBU
b28gQklHIHhkcC0+ZnJhbWVfc3ogPSAxMzEwNzIKPiBXQVJOSU5HOiBDUFU6IDAgUElEOiA1MDIw
IGF0IG5ldC9jb3JlL2ZpbHRlci5jOjQxMjEKPiAgIF9fX19icGZfeGRwX2FkanVzdF90YWlsIG5l
dC9jb3JlL2ZpbHRlci5jOjQxMjEgW2lubGluZV0KPiBXQVJOSU5HOiBDUFU6IDAgUElEOiA1MDIw
IGF0IG5ldC9jb3JlL2ZpbHRlci5jOjQxMjEKPiAgIGJwZl94ZHBfYWRqdXN0X3RhaWwrMHg0NjYv
MHhhMTAgbmV0L2NvcmUvZmlsdGVyLmM6NDEwMwo+IC4uLgo+IENhbGwgVHJhY2U6Cj4gIDxUQVNL
Pgo+ICBicGZfcHJvZ180YWRkODdlNTMwMWE0MTA1KzB4MWEvMHgxYwo+ICBfX2JwZl9wcm9nX3J1
biBpbmNsdWRlL2xpbnV4L2ZpbHRlci5oOjYwMCBbaW5saW5lXQo+ICBicGZfcHJvZ19ydW5feGRw
IGluY2x1ZGUvbGludXgvZmlsdGVyLmg6Nzc1IFtpbmxpbmVdCj4gIGJwZl9wcm9nX3J1bl9nZW5l
cmljX3hkcCsweDU3ZS8weDExZTAgbmV0L2NvcmUvZGV2LmM6NDcyMQo+ICBuZXRpZl9yZWNlaXZl
X2dlbmVyaWNfeGRwIG5ldC9jb3JlL2Rldi5jOjQ4MDcgW2lubGluZV0KPiAgZG9feGRwX2dlbmVy
aWMrMHgzNWMvMHg3NzAgbmV0L2NvcmUvZGV2LmM6NDg2Ngo+ICB0dW5fZ2V0X3VzZXIrMHgyMzQw
LzB4M2NhMCBkcml2ZXJzL25ldC90dW4uYzoxOTE5Cj4gIHR1bl9jaHJfd3JpdGVfaXRlcisweGU4
LzB4MjEwIGRyaXZlcnMvbmV0L3R1bi5jOjIwNDMKPiAgY2FsbF93cml0ZV9pdGVyIGluY2x1ZGUv
bGludXgvZnMuaDoxODcxIFtpbmxpbmVdCj4gIG5ld19zeW5jX3dyaXRlIGZzL3JlYWRfd3JpdGUu
Yzo0OTEgW2lubGluZV0KPiAgdmZzX3dyaXRlKzB4NjUwLzB4ZTQwIGZzL3JlYWRfd3JpdGUuYzo1
ODQKPiAga3N5c193cml0ZSsweDEyZi8weDI1MCBmcy9yZWFkX3dyaXRlLmM6NjM3Cj4gIGRvX3N5
c2NhbGxfeDY0IGFyY2gveDg2L2VudHJ5L2NvbW1vbi5jOjUwIFtpbmxpbmVdCj4gIGRvX3N5c2Nh
bGxfNjQrMHgzOC8weGIwIGFyY2gveDg2L2VudHJ5L2NvbW1vbi5jOjgwCj4gIGVudHJ5X1NZU0NB
TExfNjRfYWZ0ZXJfaHdmcmFtZSsweDYzLzB4Y2QKPgo+IHhkcC0+ZnJhbWVfc3ogPiBQQUdFX1NJ
WkUgY2hlY2sgd2FzIGludHJvZHVjZWQgaW4gY29tbWl0IGM4NzQxZTJiZmU4Nwo+ICgieGRwOiBB
bGxvdyBicGZfeGRwX2FkanVzdF90YWlsKCkgdG8gZ3JvdyBwYWNrZXQgc2l6ZSIpLiBCdXQKPiB0
dW5fZ2V0X3VzZXIoKSBzdGlsbCBwcm92aWRlcyBhbiBleGVjdXRpb24gcGF0aCB3aXRoIGRvX3hk
cF9nZW5lcmljKCkKPiBhbmQgZXhjZWVkIFhEUCBsaW1pdHMgZm9yIHBhY2tldCBzaXplLgo+Cj4g
VXNpbmcgdGhlIHN5emthbGxlciByZXBybyB3aXRoIHJlZHVjZWQgcGFja2V0IHNpemUgaXQgd2Fz
IGFsc28KPiBkaXNjb3ZlcmVkIHRoYXQgWERQX1BBQ0tFVF9IRUFEUk9PTSBpcyBub3QgY2hlY2tl
ZCBpbgo+IHR1bl9jYW5fYnVpbGRfc2tiKCksIGFsdGhvdWdoIHBhZCBtYXkgYmUgaW5jcmVtZW50
ZWQgaW4KPiB0dW5fYnVpbGRfc2tiKCkuCj4KPiBJZiB3ZSBtb3ZlIHRoZSBsaW1pdCBjaGVjayBm
cm9tIHR1bl9jYW5fYnVpbGRfc2tiKCkgdG8gdHVuX2J1aWxkX3NrYigpCj4gd2Ugd2lsbCBtYWtl
IHhkcCB0byBiZSB1c2VkIG9ubHkgaW4gdHVuX2J1aWxkX3NrYigpLCB3aXRob3V0IGZhbGxpbmcK
PiBpbiB0dW5fYWxsb2Nfc2tiKCksIGV0Yy4gQW5kIG1vcmVvdmVyIHdlIHdpbGwgZHJvcCB0aGUg
cGFja2V0IHdoaWNoCj4gY2FuJ3QgYmUgcHJvY2Vzc2VkIGluIHR1bl9idWlsZF9za2IoKS4KPgo+
IFJlcG9ydGVkLWFuZC10ZXN0ZWQtYnk6IHN5emJvdCtmODE3NDkwZjViZDIwNTQxYjkwYUBzeXpr
YWxsZXIuYXBwc3BvdG1haWwuY29tCj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMDAwMDAwMDAwMDAwNzc0YjkyMDVmMWQ4YTgwZEBnb29nbGUuY29tL1QvCj4gTGluazogaHR0
cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2lkPTUzMzVjN2M2MmJmZmY4OWJiYjFjOGYx
NGNkYWJlYmU5MTkwOTA2MGYKPiBGaXhlczogN2RmMTMyMTlkNzU3ICgidHVuOiByZXNlcnZlIGV4
dHJhIGhlYWRyb29tIG9ubHkgd2hlbiBYRFAgaXMgc2V0IikKPiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXcgS2FubmVyIDxhbmRyZXcua2FubmVyQGdtYWlsLmNvbT4KPiAtLS0KPgo+IE5vdGVzOgo+ICAg
ICBWMiAtPiBWMzoKPiAgICAgKiBhdHRhY2ggdGhlIGZvcmdvdHRlbiBjaGFuZ2Vsb2cKPiAgICAg
VjEgLT4gVjI6Cj4gICAgICogbWVyZ2VkIDIgcGF0Y2hlcyBpbiAxLCBmaXhpbmcgYm90aCBpc3N1
ZXM6IFdBUk5fT05fT05DRSB3aXRoCj4gICAgICAgc3l6a2FsbGVyIHJlcHJvIGFuZCBtaXNzaW5n
IFhEUF9QQUNLRVRfSEVBRFJPT00gaW4gcGFkCj4gICAgICogY2hhbmdlZCB0aGUgdGl0bGUgYW5k
IGRlc2NyaXB0aW9uIG9mIHRoZSBleGVjdXRpb24gcGF0aCwgc3VnZ2VzdGVkCj4gICAgICAgYnkg
SmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPiAgICAgKiBtb3ZlIHRoZSBsaW1pdCBj
aGVjayBmcm9tIHR1bl9jYW5fYnVpbGRfc2tiKCkgdG8gdHVuX2J1aWxkX3NrYigpIHRvCj4gICAg
ICAgcmVtb3ZlIGR1cGxpY2F0aW9uIGFuZCBsb2NraW5nIGlzc3VlLCBhbmQgYWxzbyBkcm9wIHRo
ZSBwYWNrZXQgaW4KPiAgICAgICBjYXNlIG9mIGEgZmFpbGVkIGNoZWNrIC0gbm90ZWQgYnkgSmFz
b24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KCkFja2VkLWJ5OiBKYXNvbiBXYW5nIDxqYXNv
d2FuZ0ByZWRoYXQuY29tPgoKVGhhbmtzCgo+Cj4gIGRyaXZlcnMvbmV0L3R1bi5jIHwgNyArKyst
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvdHVuLmMgYi9kcml2ZXJzL25ldC90dW4uYwo+IGlu
ZGV4IGQ3NTQ1NmFkYzYyYS4uN2MyYjA1Y2UwNDIxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0
L3R1bi5jCj4gKysrIGIvZHJpdmVycy9uZXQvdHVuLmMKPiBAQCAtMTU5NCwxMCArMTU5NCw2IEBA
IHN0YXRpYyBib29sIHR1bl9jYW5fYnVpbGRfc2tiKHN0cnVjdCB0dW5fc3RydWN0ICp0dW4sIHN0
cnVjdCB0dW5fZmlsZSAqdGZpbGUsCj4gICAgICAgICBpZiAoemVyb2NvcHkpCj4gICAgICAgICAg
ICAgICAgIHJldHVybiBmYWxzZTsKPgo+IC0gICAgICAgaWYgKFNLQl9EQVRBX0FMSUdOKGxlbiAr
IFRVTl9SWF9QQUQpICsKPiAtICAgICAgICAgICBTS0JfREFUQV9BTElHTihzaXplb2Yoc3RydWN0
IHNrYl9zaGFyZWRfaW5mbykpID4gUEFHRV9TSVpFKQo+IC0gICAgICAgICAgICAgICByZXR1cm4g
ZmFsc2U7Cj4gLQo+ICAgICAgICAgcmV0dXJuIHRydWU7Cj4gIH0KPgo+IEBAIC0xNjczLDYgKzE2
NjksOSBAQCBzdGF0aWMgc3RydWN0IHNrX2J1ZmYgKnR1bl9idWlsZF9za2Ioc3RydWN0IHR1bl9z
dHJ1Y3QgKnR1biwKPiAgICAgICAgIGJ1ZmxlbiArPSBTS0JfREFUQV9BTElHTihsZW4gKyBwYWQp
Owo+ICAgICAgICAgcmN1X3JlYWRfdW5sb2NrKCk7Cj4KPiArICAgICAgIGlmIChidWZsZW4gPiBQ
QUdFX1NJWkUpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBFUlJfUFRSKC1FRkFVTFQpOwo+ICsK
PiAgICAgICAgIGFsbG9jX2ZyYWctPm9mZnNldCA9IEFMSUdOKCh1NjQpYWxsb2NfZnJhZy0+b2Zm
c2V0LCBTTVBfQ0FDSEVfQllURVMpOwo+ICAgICAgICAgaWYgKHVubGlrZWx5KCFza2JfcGFnZV9m
cmFnX3JlZmlsbChidWZsZW4sIGFsbG9jX2ZyYWcsIEdGUF9LRVJORUwpKSkKPiAgICAgICAgICAg
ICAgICAgcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7Cj4gLS0KPiAyLjM5LjMKPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRl
ZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgta2VybmVsLW1lbnRlZXMK
