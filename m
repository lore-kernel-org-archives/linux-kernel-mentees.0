Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AE7C001DE
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 26 Jul 2023 09:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A38E41BE6;
	Wed, 26 Jul 2023 09:02:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A38E41BE6
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=afLvvVA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HnB7OBv8OfFL; Wed, 26 Jul 2023 09:02:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A020341BEE;
	Wed, 26 Jul 2023 09:02:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A020341BEE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8AEF3C0072;
	Wed, 26 Jul 2023 09:02:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0BA44C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Jul 2023 09:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD012405B1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Jul 2023 09:02:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD012405B1
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=afLvvVA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RqkSKcjZx8Pi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Jul 2023 09:02:32 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4EE3E4002B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Jul 2023 09:02:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EE3E4002B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690362151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fbCnVEZGVan0LOAWlI9A4kVTUyU9gSMJrtUcgBn70zY=;
 b=afLvvVA4v1YAjjXZu2tzCgbrAV5MUEfgyVmYbsdypPqmKtWQS+CtNhBxqru/OChJwHQ/r2
 H4C/oy1TNPhimg4/6R6pP7E/YYsn3A86y2HADo45wemiVwC8hsSDE9G/xT7eTC9l59oL1q
 BIHQ2e/AMq987l4poeT7p+C7cgbozVU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-1h4oCL2VNwCKgg2QmE7SeQ-1; Wed, 26 Jul 2023 05:02:29 -0400
X-MC-Unique: 1h4oCL2VNwCKgg2QmE7SeQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-94a356c74e0so428430566b.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Jul 2023 02:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690362148; x=1690966948;
 h=content-transfer-encoding:in-reply-to:references:to
 :content-language:subject:cc:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fbCnVEZGVan0LOAWlI9A4kVTUyU9gSMJrtUcgBn70zY=;
 b=SsDQuxOg3NDXbwJimve1317qAxczbhAcpGFTIns3V3RH1WxYv/dN8DSFMppNoysBU8
 T1kazf5FX5uOH8t0kivGahMbqxQ+GfQie/uzpGYGDOH6cY4PI0rv6IMhbmD7F6FBjPOy
 MSyzswukhvok7Z1n/XhzE7FtZIE2n2psJUFCJTZlZC8NTzX8DYRj10/ZY83plksehfbv
 L5ciyqNsZ1AmzImLUOgJ/3/4u2qFooyGxChDJQwd46UtLBhXcynCXMdfKkDJutWC4zym
 wi65CXWXA9ZA8+OY3iLtzZpCh61D1zdoufbsVsJAgUtEsIJmKm5gbtcCorrEaMwaCoQ3
 cdxg==
X-Gm-Message-State: ABy/qLZTyYbodwjyEngQ+nfvbr/LnZuFwuB88DrZPIh7Wib54V2WokCS
 bTgeRUGibdLdP+PdA7lwiJsvDocTw3LlL0TpYy7nR1xgZx8gwEnps3BWASJDoKg7w7Ig8TVjKEm
 JeKgm+ijqfj84j8wWqWOYPmGgELtAcQQN5zvnDQ80NoTOvkj4
X-Received: by 2002:a17:906:cd0d:b0:993:f9d4:eab3 with SMTP id
 oz13-20020a170906cd0d00b00993f9d4eab3mr1096764ejb.18.1690362148588; 
 Wed, 26 Jul 2023 02:02:28 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEqRtx90yFrstV2jcIP+3tnAJ6nGUMmC+UhepeKXSD2mg/LZv0m+3f5MZ/vIWUuOk1Kx0p28w==
X-Received: by 2002:a17:906:cd0d:b0:993:f9d4:eab3 with SMTP id
 oz13-20020a170906cd0d00b00993f9d4eab3mr1096746ejb.18.1690362148245; 
 Wed, 26 Jul 2023 02:02:28 -0700 (PDT)
Received: from [192.168.42.222] (194-45-78-10.static.kviknet.net.
 [194.45.78.10]) by smtp.gmail.com with ESMTPSA id
 c11-20020a170906924b00b0098e34446464sm9283162ejx.25.2023.07.26.02.02.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 02:02:27 -0700 (PDT)
From: Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <ab722ec1-ae45-af1f-b869-e7339402c852@redhat.com>
Date: Wed, 26 Jul 2023 11:02:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3] drivers: net: prevent tun_get_user() to exceed xdp
 size limits
To: Jason Wang <jasowang@redhat.com>, Andrew Kanner <andrew.kanner@gmail.com>
References: <20230725155403.796-1-andrew.kanner@gmail.com>
 <CACGkMEt=Cd8J995+0k=6MT1Pj=Fk9E_r2eZREptLt2osj_H-hA@mail.gmail.com>
In-Reply-To: <CACGkMEt=Cd8J995+0k=6MT1Pj=Fk9E_r2eZREptLt2osj_H-hA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: syzbot+f817490f5bd20541b90a@syzkaller.appspotmail.com,
 netdev@vger.kernel.org, David Ahern <dsahern@gmail.com>,
 John Fastabend <john.fastabend@gmail.com>, linux-kernel@vger.kernel.org,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Q2MuIEpvaG4gYW5kIEFoZXJuCgpPbiAyNi8wNy8yMDIzIDA0LjA5LCBKYXNvbiBXYW5nIHdyb3Rl
Ogo+IE9uIFR1ZSwgSnVsIDI1LCAyMDIzIGF0IDExOjU04oCvUE0gQW5kcmV3IEthbm5lciA8YW5k
cmV3Lmthbm5lckBnbWFpbC5jb20+IHdyb3RlOgo+Pgo+PiBTeXprYWxsZXIgcmVwb3J0ZWQgdGhl
IGZvbGxvd2luZyBpc3N1ZToKPj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09Cj4+IFRvbyBCSUcgeGRwLT5mcmFtZV9zeiA9IDEzMTA3MgoKSXMgdGhpcyBhIGNvbnRpZ3Vv
dXMgcGh5c2ljYWwgbWVtb3J5IGFsbG9jYXRpb24/CgoxMzEwNzIgYnl0ZXMgZXF1YWwgb3JkZXIg
NSBwYWdlLgoKTG9va2luZyBhdCB0dW4uYyBjb2RlIEkgY2Fubm90IGZpbmQgYSBjb2RlIHBhdGgg
dGhhdCBjb3VsZCBjcmVhdGUKb3JkZXItNSBza2ItPmRhdGEsIGJ1dCBvbmx5IFNLQiB3aXRoIG9y
ZGVyLTAgZnJhZ21lbnRzLiAgQnV0IEkgZ3Vlc3MgaXQKaXMgdGhlIG5ldGlmX3JlY2VpdmVfZ2Vu
ZXJpY194ZHAoKSB3aGF0IHdpbGwgcmVhbGxvYyB0byBtYWtlIHRoaXMgbGluZWFyCih2aWEgc2ti
X2xpbmVhcml6ZSgpKQoKPj4gV0FSTklORzogQ1BVOiAwIFBJRDogNTAyMCBhdCBuZXQvY29yZS9m
aWx0ZXIuYzo0MTIxCj4+ICAgIF9fX19icGZfeGRwX2FkanVzdF90YWlsIG5ldC9jb3JlL2ZpbHRl
ci5jOjQxMjEgW2lubGluZV0KPj4gV0FSTklORzogQ1BVOiAwIFBJRDogNTAyMCBhdCBuZXQvY29y
ZS9maWx0ZXIuYzo0MTIxCj4+ICAgIGJwZl94ZHBfYWRqdXN0X3RhaWwrMHg0NjYvMHhhMTAgbmV0
L2NvcmUvZmlsdGVyLmM6NDEwMwo+PiAuLi4KPj4gQ2FsbCBUcmFjZToKPj4gICA8VEFTSz4KPj4g
ICBicGZfcHJvZ180YWRkODdlNTMwMWE0MTA1KzB4MWEvMHgxYwo+PiAgIF9fYnBmX3Byb2dfcnVu
IGluY2x1ZGUvbGludXgvZmlsdGVyLmg6NjAwIFtpbmxpbmVdCj4+ICAgYnBmX3Byb2dfcnVuX3hk
cCBpbmNsdWRlL2xpbnV4L2ZpbHRlci5oOjc3NSBbaW5saW5lXQo+PiAgIGJwZl9wcm9nX3J1bl9n
ZW5lcmljX3hkcCsweDU3ZS8weDExZTAgbmV0L2NvcmUvZGV2LmM6NDcyMQo+PiAgIG5ldGlmX3Jl
Y2VpdmVfZ2VuZXJpY194ZHAgbmV0L2NvcmUvZGV2LmM6NDgwNyBbaW5saW5lXQo+PiAgIGRvX3hk
cF9nZW5lcmljKzB4MzVjLzB4NzcwIG5ldC9jb3JlL2Rldi5jOjQ4NjYKPj4gICB0dW5fZ2V0X3Vz
ZXIrMHgyMzQwLzB4M2NhMCBkcml2ZXJzL25ldC90dW4uYzoxOTE5Cj4+ICAgdHVuX2Nocl93cml0
ZV9pdGVyKzB4ZTgvMHgyMTAgZHJpdmVycy9uZXQvdHVuLmM6MjA0Mwo+PiAgIGNhbGxfd3JpdGVf
aXRlciBpbmNsdWRlL2xpbnV4L2ZzLmg6MTg3MSBbaW5saW5lXQo+PiAgIG5ld19zeW5jX3dyaXRl
IGZzL3JlYWRfd3JpdGUuYzo0OTEgW2lubGluZV0KPj4gICB2ZnNfd3JpdGUrMHg2NTAvMHhlNDAg
ZnMvcmVhZF93cml0ZS5jOjU4NAo+PiAgIGtzeXNfd3JpdGUrMHgxMmYvMHgyNTAgZnMvcmVhZF93
cml0ZS5jOjYzNwo+PiAgIGRvX3N5c2NhbGxfeDY0IGFyY2gveDg2L2VudHJ5L2NvbW1vbi5jOjUw
IFtpbmxpbmVdCj4+ICAgZG9fc3lzY2FsbF82NCsweDM4LzB4YjAgYXJjaC94ODYvZW50cnkvY29t
bW9uLmM6ODAKPj4gICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg2My8weGNkCj4+
Cj4+IHhkcC0+ZnJhbWVfc3ogPiBQQUdFX1NJWkUgY2hlY2sgd2FzIGludHJvZHVjZWQgaW4gY29t
bWl0IGM4NzQxZTJiZmU4Nwo+PiAoInhkcDogQWxsb3cgYnBmX3hkcF9hZGp1c3RfdGFpbCgpIHRv
IGdyb3cgcGFja2V0IHNpemUiKS4gQnV0Cj4+IHR1bl9nZXRfdXNlcigpIHN0aWxsIHByb3ZpZGVz
IGFuIGV4ZWN1dGlvbiBwYXRoIHdpdGggZG9feGRwX2dlbmVyaWMoKQo+PiBhbmQgZXhjZWVkIFhE
UCBsaW1pdHMgZm9yIHBhY2tldCBzaXplLgoKSSBhZGRlZCB0aGlzIGNoZWNrIGFuZCBtYXliZSBp
dCBpcyB0b28gc3RyaWN0LiBYRFAgY2FuIHdvcmsgb24gaGlnaGVyCm9yZGVyIHBhZ2VzLCBhcyBs
b25nIGFzIHRoaXMgaXMgY29udGlndW91cyBwaHlzaWNhbCBtZW1vcnkgKGUuZy4gYSAKcGFnZSku
ICBBbmQKCkFuIG9yZGVyIDUgcGFnZSAoMTMxMDcyIGJ5dGVzKSBzZWVtcyBleGNlc3NpdmUsIGJ1
dCBtYXliZSBUVU4gaGF2ZSBhIAp1c2UtY2FzZSBmb3IgaGF2aW5nIHN1Y2ggbGFyZ2UgcGFja2V0
cz8gKFF1ZXN0aW9uIHRvIEFoZXJuPykKCkknbSBjb25zaWRlcmluZyB3ZSBzaG91bGQgY2hhbmdl
IHRoZSBzaXplLWxpbWl0IHRvIG9yZGVyLTIgKDE2Mzg0KSBvciAKb3JkZXItMyAoMzI3NjgpLgoK
T3JkZXItMyBiZWNhdXNlIG5ldHN0YWNrIGhhdmU6CiAgICNkZWZpbmUgU0tCX0ZSQUdfUEFHRV9P
UkRFUiBnZXRfb3JkZXIoMzI3NjgpCgpBbmQgb3JkZXItMiBiZWNhdXNlIG5ldHN0YWNrIGhhdmU6
IFNLQl9NQVhfQUxMT0MgKDE2S2lCKQogIC0gU2VlIGRpc2N1c3Npb24gaW4gY29tbWl0IDYzMDZj
MTE4OWU3NyAoImJwZjogUmVtb3ZlIE1UVSBjaGVjayBpbiAKX19icGZfc2tiX21heF9sZW4iKS4K
ICAtIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvdG9ydmFsZHMvYy82MzA2YzExODllNzcKCgo+Pgo+
PiBVc2luZyB0aGUgc3l6a2FsbGVyIHJlcHJvIHdpdGggcmVkdWNlZCBwYWNrZXQgc2l6ZSBpdCB3
YXMgYWxzbwo+PiBkaXNjb3ZlcmVkIHRoYXQgWERQX1BBQ0tFVF9IRUFEUk9PTSBpcyBub3QgY2hl
Y2tlZCBpbgo+PiB0dW5fY2FuX2J1aWxkX3NrYigpLCBhbHRob3VnaCBwYWQgbWF5IGJlIGluY3Jl
bWVudGVkIGluCj4+IHR1bl9idWlsZF9za2IoKS4KPj4KPj4gSWYgd2UgbW92ZSB0aGUgbGltaXQg
Y2hlY2sgZnJvbSB0dW5fY2FuX2J1aWxkX3NrYigpIHRvIHR1bl9idWlsZF9za2IoKQo+PiB3ZSB3
aWxsIG1ha2UgeGRwIHRvIGJlIHVzZWQgb25seSBpbiB0dW5fYnVpbGRfc2tiKCksIHdpdGhvdXQg
ZmFsbGluZwo+PiBpbiB0dW5fYWxsb2Nfc2tiKCksIGV0Yy4gQW5kIG1vcmVvdmVyIHdlIHdpbGwg
ZHJvcCB0aGUgcGFja2V0IHdoaWNoCj4+IGNhbid0IGJlIHByb2Nlc3NlZCBpbiB0dW5fYnVpbGRf
c2tiKCkuCgpMb29raW5nIGF0IHR1bl9idWlsZF9za2IoKSBpcyB1c2VzIHRoZSBwYWdlX2ZyYWcg
c3lzdGVtLCBhbmQgY2FuIHRodXMgCmNyZWF0ZSB1cC10byBTS0JfRlJBR19QQUdFX09SREVSIChz
aXplIDMyNzY4IC8gb3JkZXItMykuCgo+Pgo+PiBSZXBvcnRlZC1hbmQtdGVzdGVkLWJ5OiBzeXpi
b3QrZjgxNzQ5MGY1YmQyMDU0MWI5MGFAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQo+PiBDbG9z
ZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8wMDAwMDAwMDAwMDA3NzRiOTIwNWYxZDhh
ODBkQGdvb2dsZS5jb20vVC8KPj4gTGluazogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20v
YnVnP2lkPTUzMzVjN2M2MmJmZmY4OWJiYjFjOGYxNGNkYWJlYmU5MTkwOTA2MGYKPj4gRml4ZXM6
IDdkZjEzMjE5ZDc1NyAoInR1bjogcmVzZXJ2ZSBleHRyYSBoZWFkcm9vbSBvbmx5IHdoZW4gWERQ
IGlzIHNldCIpCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBLYW5uZXIgPGFuZHJldy5rYW5uZXJA
Z21haWwuY29tPgo+PiAtLS0KPj4KPj4gTm90ZXM6Cj4+ICAgICAgVjIgLT4gVjM6Cj4+ICAgICAg
KiBhdHRhY2ggdGhlIGZvcmdvdHRlbiBjaGFuZ2Vsb2cKPj4gICAgICBWMSAtPiBWMjoKPj4gICAg
ICAqIG1lcmdlZCAyIHBhdGNoZXMgaW4gMSwgZml4aW5nIGJvdGggaXNzdWVzOiBXQVJOX09OX09O
Q0Ugd2l0aAo+PiAgICAgICAgc3l6a2FsbGVyIHJlcHJvIGFuZCBtaXNzaW5nIFhEUF9QQUNLRVRf
SEVBRFJPT00gaW4gcGFkCj4+ICAgICAgKiBjaGFuZ2VkIHRoZSB0aXRsZSBhbmQgZGVzY3JpcHRp
b24gb2YgdGhlIGV4ZWN1dGlvbiBwYXRoLCBzdWdnZXN0ZWQKPj4gICAgICAgIGJ5IEphc29uIFdh
bmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4+ICAgICAgKiBtb3ZlIHRoZSBsaW1pdCBjaGVjayBm
cm9tIHR1bl9jYW5fYnVpbGRfc2tiKCkgdG8gdHVuX2J1aWxkX3NrYigpIHRvCj4+ICAgICAgICBy
ZW1vdmUgZHVwbGljYXRpb24gYW5kIGxvY2tpbmcgaXNzdWUsIGFuZCBhbHNvIGRyb3AgdGhlIHBh
Y2tldCBpbgo+PiAgICAgICAgY2FzZSBvZiBhIGZhaWxlZCBjaGVjayAtIG5vdGVkIGJ5IEphc29u
IFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4gCj4gQWNrZWQtYnk6IEphc29uIFdhbmcgPGph
c293YW5nQHJlZGhhdC5jb20+Cj4gCj4gVGhhbmtzCj4gCj4+Cj4+ICAgZHJpdmVycy9uZXQvdHVu
LmMgfCA3ICsrKy0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvdHVuLmMgYi9kcml2ZXJz
L25ldC90dW4uYwo+PiBpbmRleCBkNzU0NTZhZGM2MmEuLjdjMmIwNWNlMDQyMSAxMDA2NDQKPj4g
LS0tIGEvZHJpdmVycy9uZXQvdHVuLmMKPj4gKysrIGIvZHJpdmVycy9uZXQvdHVuLmMKPj4gQEAg
LTE1OTQsMTAgKzE1OTQsNiBAQCBzdGF0aWMgYm9vbCB0dW5fY2FuX2J1aWxkX3NrYihzdHJ1Y3Qg
dHVuX3N0cnVjdCAqdHVuLCBzdHJ1Y3QgdHVuX2ZpbGUgKnRmaWxlLAo+PiAgICAgICAgICBpZiAo
emVyb2NvcHkpCj4+ICAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+Pgo+PiAtICAgICAg
IGlmIChTS0JfREFUQV9BTElHTihsZW4gKyBUVU5fUlhfUEFEKSArCj4+IC0gICAgICAgICAgIFNL
Ql9EQVRBX0FMSUdOKHNpemVvZihzdHJ1Y3Qgc2tiX3NoYXJlZF9pbmZvKSkgPiBQQUdFX1NJWkUp
Cj4+IC0gICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4+IC0KPj4gICAgICAgICAgcmV0dXJu
IHRydWU7Cj4+ICAgfQo+Pgo+PiBAQCAtMTY3Myw2ICsxNjY5LDkgQEAgc3RhdGljIHN0cnVjdCBz
a19idWZmICp0dW5fYnVpbGRfc2tiKHN0cnVjdCB0dW5fc3RydWN0ICp0dW4sCj4+ICAgICAgICAg
IGJ1ZmxlbiArPSBTS0JfREFUQV9BTElHTihsZW4gKyBwYWQpOwo+PiAgICAgICAgICByY3VfcmVh
ZF91bmxvY2soKTsKPj4KPj4gKyAgICAgICBpZiAoYnVmbGVuID4gUEFHRV9TSVpFKQo+PiArICAg
ICAgICAgICAgICAgcmV0dXJuIEVSUl9QVFIoLUVGQVVMVCk7CgpDb25jcmV0ZWx5IEknbSBzYXlp
bmcgbWF5YmUgdXNlIFNLQl9GUkFHX1BBR0VfT1JERVIgInNpemUiIGhlcmU/CgplLmcuIGNyZWF0
ZSBTS0JfRlJBR19QQUdFX1NJWkUgZGVmaW5lIGFzIGJlbG93LgogIGlmIChidWZsZW4gPiBTS0Jf
RlJBR19QQUdFX1NJWkUpCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9uZXQvc29jay5oIGIvaW5jbHVk
ZS9uZXQvc29jay5oCmluZGV4IDY1NmVhODlmNjBmZi4uNGM0YjNjMjU3YjUyIDEwMDY0NAotLS0g
YS9pbmNsdWRlL25ldC9zb2NrLmgKKysrIGIvaW5jbHVkZS9uZXQvc29jay5oCkBAIC0yODg2LDcg
KzI4ODYsOCBAQCBleHRlcm4gaW50IHN5c2N0bF9vcHRtZW1fbWF4OwogIGV4dGVybiBfX3UzMiBz
eXNjdGxfd21lbV9kZWZhdWx0OwogIGV4dGVybiBfX3UzMiBzeXNjdGxfcm1lbV9kZWZhdWx0OwoK
LSNkZWZpbmUgU0tCX0ZSQUdfUEFHRV9PUkRFUiAgICBnZXRfb3JkZXIoMzI3NjgpCisjZGVmaW5l
IFNLQl9GUkFHX1BBR0VfU0laRSAgICAgMzI3NjgKKyNkZWZpbmUgU0tCX0ZSQUdfUEFHRV9PUkRF
UiAgICBnZXRfb3JkZXIoU0tCX0ZSQUdfUEFHRV9TSVpFKQogIERFQ0xBUkVfU1RBVElDX0tFWV9G
QUxTRShuZXRfaGlnaF9vcmRlcl9hbGxvY19kaXNhYmxlX2tleSk7Cgo+PiArCj4+ICAgICAgICAg
IGFsbG9jX2ZyYWctPm9mZnNldCA9IEFMSUdOKCh1NjQpYWxsb2NfZnJhZy0+b2Zmc2V0LCBTTVBf
Q0FDSEVfQllURVMpOwo+PiAgICAgICAgICBpZiAodW5saWtlbHkoIXNrYl9wYWdlX2ZyYWdfcmVm
aWxsKGJ1ZmxlbiwgYWxsb2NfZnJhZywgR0ZQX0tFUk5FTCkpKQo+PiAgICAgICAgICAgICAgICAg
IHJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwoKLS1KZXNwZXIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcg
bGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5l
bC1tZW50ZWVzCg==
