Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81C9EB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Jul 2023 03:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42B0560A8D;
	Tue, 25 Jul 2023 03:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42B0560A8D
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EhrABMrM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5TK4o-YeQC-n; Tue, 25 Jul 2023 03:28:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 26CB060A8C;
	Tue, 25 Jul 2023 03:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26CB060A8C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0F4BEC0072;
	Tue, 25 Jul 2023 03:28:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8E616C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Jul 2023 03:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68DC060A8D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Jul 2023 03:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68DC060A8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ER8CeK10IFnu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Jul 2023 03:28:48 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 620B260A8C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Jul 2023 03:28:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 620B260A8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690255727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nTDAn74ufWGAYyDGlV6tL8ew2OmLpGw/P9rq29njGkg=;
 b=EhrABMrMyvRJ2Odry2SiXLgbUbNnjQBVfogtb7zSOfCxY3Zn6HYVRWhdjPDFy8rSWhkpco
 22Rd6FSbMHq1P7K/mRUW0QCRm9yIdxixxr9tNpcRzIoeXQKiZjbkhSCoB+izBg3WvPqsBW
 1nMbBG3COJzKqZLFdpTSAsKYcUXE3Wg=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-qEhWdgCCOV6t3ola5cRvxQ-1; Mon, 24 Jul 2023 23:28:45 -0400
X-MC-Unique: qEhWdgCCOV6t3ola5cRvxQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-4fb76659d6cso4151939e87.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Jul 2023 20:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690255724; x=1690860524;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nTDAn74ufWGAYyDGlV6tL8ew2OmLpGw/P9rq29njGkg=;
 b=KZZKRjZlbs/QNhFQGr0LId9qN6t7VGN7fxaKCgDqA9sDo79oZDWIESaITAbxgK+iJb
 igguA916oTqzYNNn5vnwAJs7kJp8PFnD3d0Tf8gKkquWqZPWP76QBQpnbpF4LZvrGUpr
 ZMlNacdlFew5B7PRoYianpyCYLSG7fP8ln1q07ryy1/lL1uxrzudFvNPGdGo2mmVUrX0
 MsRGMsNRs6q0NnQDsj1Ojwwb4/381Ls4jCafDmV8k3LiQF0qK0aOaCmgq7Zc3I/xHK7L
 3O4LELTaO2s7vV5bJi534Wy/DD6t36uk9/KBSwhbfSjHlTG2mnVnlzWej3OH4ocu60rO
 X7cw==
X-Gm-Message-State: ABy/qLbgGG/puhI9d4/cuxb4hajMWsdj05JSrtH0kxXJp3qe/uhOtFVj
 kjBI7bsEv2K7i2J+/+khhjcjW3j6ikJNfinKC5TNh5cZ/rycZUxL5ESc2qZRiuhlzLYvBUJDnRE
 XDpqMzRV3KVvt14gULFOs8aGB3hgMfkflBPvHW3A54W/dmFHvw/9EcJtiBfM9JErS
X-Received: by 2002:ac2:5bc7:0:b0:4fb:7392:c72c with SMTP id
 u7-20020ac25bc7000000b004fb7392c72cmr5894675lfn.57.1690255724172; 
 Mon, 24 Jul 2023 20:28:44 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF5o+SrEQZCXouOwMSQiZ//uNeHhCD6S/5bhIifnn+1MgBriPB5z4uuFH2je1iSGA5hunLDbkddfPQyzZDyueA=
X-Received: by 2002:ac2:5bc7:0:b0:4fb:7392:c72c with SMTP id
 u7-20020ac25bc7000000b004fb7392c72cmr5894664lfn.57.1690255723877; Mon, 24 Jul
 2023 20:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230724221326.384-1-andrew.kanner@gmail.com>
In-Reply-To: <20230724221326.384-1-andrew.kanner@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 25 Jul 2023 11:28:32 +0800
Message-ID: <CACGkMEu2Outtv7F=H=aDhbnDRmDO5ZSuF9Gb583dLmaCVFknAQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drivers: net: use xdp only inside tun_build_skb()
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

T24gVHVlLCBKdWwgMjUsIDIwMjMgYXQgNjoxNOKAr0FNIEFuZHJldyBLYW5uZXIgPGFuZHJldy5r
YW5uZXJAZ21haWwuY29tPiB3cm90ZToKPgo+IFN5emthbGxlciByZXBvcnRlZCB0aGUgZm9sbG93
aW5nIGlzc3VlOgo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+IFRv
byBCSUcgeGRwLT5mcmFtZV9zeiA9IDEzMTA3Mgo+IFdBUk5JTkc6IENQVTogMCBQSUQ6IDUwMjAg
YXQgbmV0L2NvcmUvZmlsdGVyLmM6NDEyMQo+ICAgX19fX2JwZl94ZHBfYWRqdXN0X3RhaWwgbmV0
L2NvcmUvZmlsdGVyLmM6NDEyMSBbaW5saW5lXQo+IFdBUk5JTkc6IENQVTogMCBQSUQ6IDUwMjAg
YXQgbmV0L2NvcmUvZmlsdGVyLmM6NDEyMQo+ICAgYnBmX3hkcF9hZGp1c3RfdGFpbCsweDQ2Ni8w
eGExMCBuZXQvY29yZS9maWx0ZXIuYzo0MTAzCj4gLi4uCj4gQ2FsbCBUcmFjZToKPiAgPFRBU0s+
Cj4gIGJwZl9wcm9nXzRhZGQ4N2U1MzAxYTQxMDUrMHgxYS8weDFjCj4gIF9fYnBmX3Byb2dfcnVu
IGluY2x1ZGUvbGludXgvZmlsdGVyLmg6NjAwIFtpbmxpbmVdCj4gIGJwZl9wcm9nX3J1bl94ZHAg
aW5jbHVkZS9saW51eC9maWx0ZXIuaDo3NzUgW2lubGluZV0KPiAgYnBmX3Byb2dfcnVuX2dlbmVy
aWNfeGRwKzB4NTdlLzB4MTFlMCBuZXQvY29yZS9kZXYuYzo0NzIxCj4gIG5ldGlmX3JlY2VpdmVf
Z2VuZXJpY194ZHAgbmV0L2NvcmUvZGV2LmM6NDgwNyBbaW5saW5lXQo+ICBkb194ZHBfZ2VuZXJp
YysweDM1Yy8weDc3MCBuZXQvY29yZS9kZXYuYzo0ODY2Cj4gIHR1bl9nZXRfdXNlcisweDIzNDAv
MHgzY2EwIGRyaXZlcnMvbmV0L3R1bi5jOjE5MTkKPiAgdHVuX2Nocl93cml0ZV9pdGVyKzB4ZTgv
MHgyMTAgZHJpdmVycy9uZXQvdHVuLmM6MjA0Mwo+ICBjYWxsX3dyaXRlX2l0ZXIgaW5jbHVkZS9s
aW51eC9mcy5oOjE4NzEgW2lubGluZV0KPiAgbmV3X3N5bmNfd3JpdGUgZnMvcmVhZF93cml0ZS5j
OjQ5MSBbaW5saW5lXQo+ICB2ZnNfd3JpdGUrMHg2NTAvMHhlNDAgZnMvcmVhZF93cml0ZS5jOjU4
NAo+ICBrc3lzX3dyaXRlKzB4MTJmLzB4MjUwIGZzL3JlYWRfd3JpdGUuYzo2MzcKPiAgZG9fc3lz
Y2FsbF94NjQgYXJjaC94ODYvZW50cnkvY29tbW9uLmM6NTAgW2lubGluZV0KPiAgZG9fc3lzY2Fs
bF82NCsweDM4LzB4YjAgYXJjaC94ODYvZW50cnkvY29tbW9uLmM6ODAKPiAgZW50cnlfU1lTQ0FM
TF82NF9hZnRlcl9od2ZyYW1lKzB4NjMvMHhjZAo+Cj4gZnJhbWVfc3ogPCBQQUdFX1NJWkUgY2hl
Y2sgd2FzIGludHJvZHVjZWQgaW4gY29tbWl0IGM4NzQxZTJiZmU4Nwo+ICgieGRwOiBBbGxvdyBi
cGZfeGRwX2FkanVzdF90YWlsKCkgdG8gZ3JvdyBwYWNrZXQgc2l6ZSIpLgoKSSB3b25kZXIgaWYg
dGhpcyBjaGVjayBtYWtlcyBzZW5zZSBmb3IgeGRwIGdlbmVyaWMgd2hlbiBza2IgaXMgbGluZWFy
aXplZC4KCj4gQnV0Cj4gdHVuX2dldF91c2VyKCkgc3RpbGwgcHJvdmlkZXMgYW4gZXhlY3V0aW9u
IHBhdGggdG8gZXhjZWVkIFhEUCBsaW1pdHMKPiBmb3IgcGFja2V0IHNpemUuCgpJJ2Qgc3VnZ2Vz
dCBiZWluZyBzcGVjaWZpYyB0byB0aGUgZXhlY3V0aW9uIHBhdGgsIHdoaWNoIGlzIGFjdHVhbGx5
CnRoZSBnZW5lcmljIFhEUC4KCj4gVGhlIHdheSB0byBtaXRpZ2F0ZSB0aGlzIGlzIHRvIHJlZHVj
ZSB4ZHAgdG8gYmUgdXNlZAo+IG9ubHkgaW4gdHVuX2J1aWxkX3NrYigpLCB3aXRob3V0IGZhbGxp
bmcgaW4gdHVuX2FsbG9jX3NrYigpLCBldGMuCj4KPiBSZXBvcnRlZC1hbmQtdGVzdGVkLWJ5OiBz
eXpib3QrZjgxNzQ5MGY1YmQyMDU0MWI5MGFAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQo+IENs
b3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzAwMDAwMDAwMDAwMDc3NGI5MjA1ZjFk
OGE4MGRAZ29vZ2xlLmNvbS9ULwo+IExpbms6IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29t
L2J1Zz9pZD01MzM1YzdjNjJiZmZmODliYmIxYzhmMTRjZGFiZWJlOTE5MDkwNjBmCj4gU2lnbmVk
LW9mZi1ieTogQW5kcmV3IEthbm5lciA8YW5kcmV3Lmthbm5lckBnbWFpbC5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMvbmV0L3R1bi5jIHwgMTQgKysrKysrKystLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L25ldC90dW4uYyBiL2RyaXZlcnMvbmV0L3R1bi5jCj4gaW5kZXggZDc1NDU2YWRjNjJhLi4xOGNj
YmJlOTgzMGEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvdHVuLmMKPiArKysgYi9kcml2ZXJz
L25ldC90dW4uYwo+IEBAIC0xNTgwLDggKzE1ODAsMTQgQEAgc3RhdGljIHZvaWQgdHVuX3J4X2Jh
dGNoZWQoc3RydWN0IHR1bl9zdHJ1Y3QgKnR1biwgc3RydWN0IHR1bl9maWxlICp0ZmlsZSwKPiAg
fQo+Cj4gIHN0YXRpYyBib29sIHR1bl9jYW5fYnVpbGRfc2tiKHN0cnVjdCB0dW5fc3RydWN0ICp0
dW4sIHN0cnVjdCB0dW5fZmlsZSAqdGZpbGUsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgaW50IGxlbiwgaW50IG5vYmxvY2ssIGJvb2wgemVyb2NvcHkpCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgaW50IGxlbiwgaW50IG5vYmxvY2ssIGJvb2wgemVyb2NvcHksIGludCAq
c2tiX3hkcCkKPiAgewo+ICsgICAgICAgaWYgKFNLQl9EQVRBX0FMSUdOKGxlbiArIFRVTl9SWF9Q
QUQpICsKPiArICAgICAgICAgICBTS0JfREFUQV9BTElHTihzaXplb2Yoc3RydWN0IHNrYl9zaGFy
ZWRfaW5mbykpID4gUEFHRV9TSVpFKSB7Cj4gKyAgICAgICAgICAgICAgICpza2JfeGRwID0gMDsK
ClNvIGlmIFhEUCBpcyBlbmFibGVkLCB0aGUgcGFja2V0IHdpbGwgYnlwYXNzIHRoZSBicGYgcHJv
Z3JhbSB3aGljaCBpcwpzdWItb3B0aW1hbC4gSSB0aGluayB3ZSBzaG91bGQgYXQgbGVhc3QgZHJv
cCB0aGUgcGFja2V0IGluIHRoaXMgY2FzZS4KClRoYW5rcwoKPiArICAgICAgICAgICAgICAgcmV0
dXJuIGZhbHNlOwo+ICsgICAgICAgfQo+ICsKPiAgICAgICAgIGlmICgodHVuLT5mbGFncyAmIFRV
Tl9UWVBFX01BU0spICE9IElGRl9UQVApCj4gICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsK
Pgo+IEBAIC0xNTk0LDEwICsxNjAwLDYgQEAgc3RhdGljIGJvb2wgdHVuX2Nhbl9idWlsZF9za2Io
c3RydWN0IHR1bl9zdHJ1Y3QgKnR1biwgc3RydWN0IHR1bl9maWxlICp0ZmlsZSwKPiAgICAgICAg
IGlmICh6ZXJvY29weSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+Cj4gLSAgICAg
ICBpZiAoU0tCX0RBVEFfQUxJR04obGVuICsgVFVOX1JYX1BBRCkgKwo+IC0gICAgICAgICAgIFNL
Ql9EQVRBX0FMSUdOKHNpemVvZihzdHJ1Y3Qgc2tiX3NoYXJlZF9pbmZvKSkgPiBQQUdFX1NJWkUp
Cj4gLSAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiAtCj4gICAgICAgICByZXR1cm4gdHJ1
ZTsKPiAgfQo+Cj4gQEAgLTE4MDksNyArMTgxMSw3IEBAIHN0YXRpYyBzc2l6ZV90IHR1bl9nZXRf
dXNlcihzdHJ1Y3QgdHVuX3N0cnVjdCAqdHVuLCBzdHJ1Y3QgdHVuX2ZpbGUgKnRmaWxlLAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIHplcm9jb3B5ID0gdHJ1ZTsKPiAgICAgICAgIH0KPgo+IC0g
ICAgICAgaWYgKCFmcmFncyAmJiB0dW5fY2FuX2J1aWxkX3NrYih0dW4sIHRmaWxlLCBsZW4sIG5v
YmxvY2ssIHplcm9jb3B5KSkgewo+ICsgICAgICAgaWYgKHR1bl9jYW5fYnVpbGRfc2tiKHR1biwg
dGZpbGUsIGxlbiwgbm9ibG9jaywgemVyb2NvcHksICZza2JfeGRwKSAmJiAhZnJhZ3MpIHsKPiAg
ICAgICAgICAgICAgICAgLyogRm9yIHRoZSBwYWNrZXQgdGhhdCBpcyBub3QgZWFzeSB0byBiZSBw
cm9jZXNzZWQKPiAgICAgICAgICAgICAgICAgICogKGUuZyBnc28gb3IganVtYm8gcGFja2V0KSwg
d2Ugd2lsbCBkbyBpdCBhdCBhZnRlcgo+ICAgICAgICAgICAgICAgICAgKiBza2Igd2FzIGNyZWF0
ZWQgd2l0aCBnZW5lcmljIFhEUCByb3V0aW5lLgo+IC0tCj4gMi4zOS4zCj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVz
IG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24u
b3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWtlcm5lbC1tZW50ZWVzCg==
