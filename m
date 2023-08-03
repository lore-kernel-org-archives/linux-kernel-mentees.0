Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE468C001DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  3 Aug 2023 03:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80B7260D95;
	Thu,  3 Aug 2023 03:20:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80B7260D95
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T8sryNJA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FxQEntvJQSuc; Thu,  3 Aug 2023 03:20:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8017660BDB;
	Thu,  3 Aug 2023 03:20:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8017660BDB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D1C7C0071;
	Thu,  3 Aug 2023 03:20:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9192BC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 03:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C34C60701
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 03:20:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C34C60701
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id luAaCUjMdlTv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 03:20:36 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A1DF60AE1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 03:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A1DF60AE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691032835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QovWFaxHnWeqR0vsWVD+az55lOwaqV+kKvtZL++WfzY=;
 b=T8sryNJAQ0kZ1BE8gimpDl5+Dgwx8JnyyZFcmFIlvDlQYlZPgoMI209R85NvM+OTo/Y8Sh
 VZb7tw4gSoFlvGb2ZZgfuiD5PIoHpXWwM2bApUztslvZw4rzrOTiQb+TcerdPSqCmqmWEg
 UYY8dpwJi6ael6VkZLuARcKtR1UAoUE=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-eW8z-zTNMRaBtQxcwMj2Pg-1; Wed, 02 Aug 2023 23:20:33 -0400
X-MC-Unique: eW8z-zTNMRaBtQxcwMj2Pg-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2b9e014111fso4273231fa.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 02 Aug 2023 20:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691032832; x=1691637632;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QovWFaxHnWeqR0vsWVD+az55lOwaqV+kKvtZL++WfzY=;
 b=F1FdE5uK3VHTan3DulEgWG9UrJR0b0TjxFDfmm2MNj8P5Q9FsBKewHvk4rPyQ7zMCJ
 Qs+BS2Y1u38zcMsv5y6qk9jL+CeMlWgoIQgAYq+me7BHJZXs6dXGxZ10gWSlSLacsEdF
 DBsevXvAyC8GVknj7G0wiiwWW9mP+5XGDr+sDcmR7Ow++tQOuTLG/g+6z2A9VfyN2TX9
 6vxGHnbnTBlgo1CepGILUqMnooEJA4DMKEoDZGDq/15hLZyayB5RA9z8mwVQK4o7Lo+t
 XfYmz/KeWb2vV7LRjk4HqL9G2ePJxwugwJ6ZJDegog6p/CcP/P3XnBodvB/6fK01kVi4
 Dpyw==
X-Gm-Message-State: ABy/qLbhhNK/bLOiAqFNErNe4tsxjy2+DeF+1jnEtW+1Ua77jBIM9wzD
 ljuMRc9z9xSGTzVf7S+u03QHzHLiku1ZR7suIXvCpnLXhJt/xiSIaauCfLqxb9KGXNxFi7YWI8H
 nOYLh9enUDsif/mz7IJZkpEr3NOocczOVgWsw5KKl7ltjcp06V1GB2q4kyW7JopTA
X-Received: by 2002:a2e:964e:0:b0:2b9:e701:ac48 with SMTP id
 z14-20020a2e964e000000b002b9e701ac48mr6600475ljh.32.1691032832463; 
 Wed, 02 Aug 2023 20:20:32 -0700 (PDT)
X-Google-Smtp-Source: APBJJlETOgSsHd7bMfj2t0yr6N9rcMcAX7TnYSzl+FA8xdXceqfOu5sepJNkq4Hwq08yfISEjwj2LTwuXlc9sOWBhWQ=
X-Received: by 2002:a2e:964e:0:b0:2b9:e701:ac48 with SMTP id
 z14-20020a2e964e000000b002b9e701ac48mr6600470ljh.32.1691032832279; Wed, 02
 Aug 2023 20:20:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230801220710.464-1-andrew.kanner@gmail.com>
 <20230801220710.464-2-andrew.kanner@gmail.com>
In-Reply-To: <20230801220710.464-2-andrew.kanner@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 3 Aug 2023 11:20:20 +0800
Message-ID: <CACGkMEtRyEkpRetANvU1L97gLtVVT+vaBV1Hmh2QqZu9c9tvYw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] net: core: remove unnecessary frame_sz check in
 bpf_xdp_adjust_tail()
To: Andrew Kanner <andrew.kanner@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: syzbot+f817490f5bd20541b90a@syzkaller.appspotmail.com,
 netdev@vger.kernel.org, dsahern@gmail.com, john.fastabend@gmail.com,
 linux-kernel@vger.kernel.org, jbrouer@redhat.com, edumazet@google.com,
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

T24gV2VkLCBBdWcgMiwgMjAyMyBhdCA2OjA54oCvQU0gQW5kcmV3IEthbm5lciA8YW5kcmV3Lmth
bm5lckBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gU3l6a2FsbGVyIHJlcG9ydGVkIHRoZSBmb2xsb3dp
bmcgaXNzdWU6Cj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gVG9v
IEJJRyB4ZHAtPmZyYW1lX3N6ID0gMTMxMDcyCj4gV0FSTklORzogQ1BVOiAwIFBJRDogNTAyMCBh
dCBuZXQvY29yZS9maWx0ZXIuYzo0MTIxCj4gICBfX19fYnBmX3hkcF9hZGp1c3RfdGFpbCBuZXQv
Y29yZS9maWx0ZXIuYzo0MTIxIFtpbmxpbmVdCj4gV0FSTklORzogQ1BVOiAwIFBJRDogNTAyMCBh
dCBuZXQvY29yZS9maWx0ZXIuYzo0MTIxCj4gICBicGZfeGRwX2FkanVzdF90YWlsKzB4NDY2LzB4
YTEwIG5ldC9jb3JlL2ZpbHRlci5jOjQxMDMKPiAuLi4KPiBDYWxsIFRyYWNlOgo+ICA8VEFTSz4K
PiAgYnBmX3Byb2dfNGFkZDg3ZTUzMDFhNDEwNSsweDFhLzB4MWMKPiAgX19icGZfcHJvZ19ydW4g
aW5jbHVkZS9saW51eC9maWx0ZXIuaDo2MDAgW2lubGluZV0KPiAgYnBmX3Byb2dfcnVuX3hkcCBp
bmNsdWRlL2xpbnV4L2ZpbHRlci5oOjc3NSBbaW5saW5lXQo+ICBicGZfcHJvZ19ydW5fZ2VuZXJp
Y194ZHArMHg1N2UvMHgxMWUwIG5ldC9jb3JlL2Rldi5jOjQ3MjEKPiAgbmV0aWZfcmVjZWl2ZV9n
ZW5lcmljX3hkcCBuZXQvY29yZS9kZXYuYzo0ODA3IFtpbmxpbmVdCj4gIGRvX3hkcF9nZW5lcmlj
KzB4MzVjLzB4NzcwIG5ldC9jb3JlL2Rldi5jOjQ4NjYKPiAgdHVuX2dldF91c2VyKzB4MjM0MC8w
eDNjYTAgZHJpdmVycy9uZXQvdHVuLmM6MTkxOQo+ICB0dW5fY2hyX3dyaXRlX2l0ZXIrMHhlOC8w
eDIxMCBkcml2ZXJzL25ldC90dW4uYzoyMDQzCj4gIGNhbGxfd3JpdGVfaXRlciBpbmNsdWRlL2xp
bnV4L2ZzLmg6MTg3MSBbaW5saW5lXQo+ICBuZXdfc3luY193cml0ZSBmcy9yZWFkX3dyaXRlLmM6
NDkxIFtpbmxpbmVdCj4gIHZmc193cml0ZSsweDY1MC8weGU0MCBmcy9yZWFkX3dyaXRlLmM6NTg0
Cj4gIGtzeXNfd3JpdGUrMHgxMmYvMHgyNTAgZnMvcmVhZF93cml0ZS5jOjYzNwo+ICBkb19zeXNj
YWxsX3g2NCBhcmNoL3g4Ni9lbnRyeS9jb21tb24uYzo1MCBbaW5saW5lXQo+ICBkb19zeXNjYWxs
XzY0KzB4MzgvMHhiMCBhcmNoL3g4Ni9lbnRyeS9jb21tb24uYzo4MAo+ICBlbnRyeV9TWVNDQUxM
XzY0X2FmdGVyX2h3ZnJhbWUrMHg2My8weGNkCj4KPiB4ZHAtPmZyYW1lX3N6ID4gUEFHRV9TSVpF
IGNoZWNrIHdhcyBpbnRyb2R1Y2VkIGluIGNvbW1pdCBjODc0MWUyYmZlODcKPiAoInhkcDogQWxs
b3cgYnBmX3hkcF9hZGp1c3RfdGFpbCgpIHRvIGdyb3cgcGFja2V0IHNpemUiKS4gQnV0IEplc3Bl
cgo+IERhbmdhYXJkIEJyb3VlciA8amJyb3VlckByZWRoYXQuY29tPiBub3RlZCB0aGF0IGFmdGVy
IGludHJvZHVjaW5nIHRoZQo+IHhkcF9pbml0X2J1ZmYoKSB3aGljaCBhbGwgWERQIGRyaXZlciB1
c2UgLSBpdCdzIHNhZmUgdG8gcmVtb3ZlIHRoaXMKPiBjaGVjay4gVGhlIG9yaWdpbmFsIGludGVu
ZCB3YXMgdG8gY2F0Y2ggY2FzZXMgd2hlcmUgWERQIGRyaXZlcnMgaGF2ZQo+IG5vdCBiZWVuIHVw
ZGF0ZWQgdG8gdXNlIHhkcC5mcmFtZV9zeiwgYnV0IHRoYXQgaXMgbm90IGxvbmdlciBhIGNvbmNl
cm4KPiAoc2luY2UgeGRwX2luaXRfYnVmZikuCj4KPiBSdW5uaW5nIHRoZSBpbml0aWFsIHN5emth
bGxlciByZXBybyBpdCB3YXMgZGlzY292ZXJlZCB0aGF0IHRoZQo+IGNvbnRpZ3VvdXMgcGh5c2lj
YWwgbWVtb3J5IGFsbG9jYXRpb24gaXMgdXNlZCBmb3IgYm90aCB4ZHAgcGF0aHMgaW4KPiB0dW5f
Z2V0X3VzZXIoKSwgZS5nLiB0dW5fYnVpbGRfc2tiKCkgYW5kIHR1bl9hbGxvY19za2IoKS4gSXQg
d2FzIGFsc28KPiBzdGF0ZWQgYnkgSmVzcGVyIERhbmdhYXJkIEJyb3VlciA8amJyb3VlckByZWRo
YXQuY29tPiB0aGF0IFhEUCBjYW4KPiB3b3JrIG9uIGhpZ2hlciBvcmRlciBwYWdlcywgYXMgbG9u
ZyBhcyB0aGlzIGlzIGNvbnRpZ3VvdXMgcGh5c2ljYWwKPiBtZW1vcnkgKGUuZy4gYSBwYWdlKS4K
Pgo+IFJlcG9ydGVkLWFuZC10ZXN0ZWQtYnk6IHN5emJvdCtmODE3NDkwZjViZDIwNTQxYjkwYUBz
eXprYWxsZXIuYXBwc3BvdG1haWwuY29tCj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvMDAwMDAwMDAwMDAwNzc0YjkyMDVmMWQ4YTgwZEBnb29nbGUuY29tL1QvCj4gTGluazog
aHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2V4dGlkPWY4MTc0OTBmNWJkMjA1NDFi
OTBhCj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwNzI1MTU1NDAzLjc5
Ni0xLWFuZHJldy5rYW5uZXJAZ21haWwuY29tL1QvCj4gRml4ZXM6IDQzYjUxNjlkODM1NSAoIm5l
dCwgeGRwOiBJbnRyb2R1Y2UgeGRwX2luaXRfYnVmZiB1dGlsaXR5IHJvdXRpbmUiKQo+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJldyBLYW5uZXIgPGFuZHJldy5rYW5uZXJAZ21haWwuY29tPgoKQWNrZWQt
Ynk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+CgpUaGFua3MKCj4gLS0tCj4gIG5l
dC9jb3JlL2ZpbHRlci5jIHwgNiAtLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvbmV0L2NvcmUvZmlsdGVyLmMgYi9uZXQvY29yZS9maWx0ZXIu
Ywo+IGluZGV4IDA2YmEwZTU2ZTM2OS4uMjhhNTk1OTY5ODdhIDEwMDY0NAo+IC0tLSBhL25ldC9j
b3JlL2ZpbHRlci5jCj4gKysrIGIvbmV0L2NvcmUvZmlsdGVyLmMKPiBAQCAtNDExNiwxMiArNDEx
Niw2IEBAIEJQRl9DQUxMXzIoYnBmX3hkcF9hZGp1c3RfdGFpbCwgc3RydWN0IHhkcF9idWZmICos
IHhkcCwgaW50LCBvZmZzZXQpCj4gICAgICAgICBpZiAodW5saWtlbHkoZGF0YV9lbmQgPiBkYXRh
X2hhcmRfZW5kKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4KPiAtICAgICAg
IC8qIEFMTCBkcml2ZXJzIE1VU1QgaW5pdCB4ZHAtPmZyYW1lX3N6LCBjaGlja2VuIGNoZWNrIGJl
bG93ICovCj4gLSAgICAgICBpZiAodW5saWtlbHkoeGRwLT5mcmFtZV9zeiA+IFBBR0VfU0laRSkp
IHsKPiAtICAgICAgICAgICAgICAgV0FSTl9PTkNFKDEsICJUb28gQklHIHhkcC0+ZnJhbWVfc3og
PSAlZFxuIiwgeGRwLT5mcmFtZV9zeik7Cj4gLSAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFM
Owo+IC0gICAgICAgfQo+IC0KPiAgICAgICAgIGlmICh1bmxpa2VseShkYXRhX2VuZCA8IHhkcC0+
ZGF0YSArIEVUSF9ITEVOKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4KPiAt
LQo+IDIuMzkuMwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRl
ZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
