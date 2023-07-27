Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45803C00528
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Jul 2023 09:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFD4B61315;
	Thu, 27 Jul 2023 09:30:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFD4B61315
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gr0OhK94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P_EjMyg0fYAO; Thu, 27 Jul 2023 09:30:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id AA18A61311;
	Thu, 27 Jul 2023 09:30:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA18A61311
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78DDCC0072;
	Thu, 27 Jul 2023 09:30:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1943C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Jul 2023 09:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4F1B41E65
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Jul 2023 09:30:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4F1B41E65
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=gr0OhK94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dmbF2w8vKzru
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Jul 2023 09:30:50 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81E0441E5E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Jul 2023 09:30:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81E0441E5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690450249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qh+q07rt8r6bDYqg41H3ezz9L7B6DNPwkct/izi2KJE=;
 b=gr0OhK94/YkLtt7Ockv4cjxdroFUnnEuglRIVrN7poI+w/Rf18xktSomkPJw61P//sciJL
 8HuGRKzewsdLXbQoiVkPZqIbFDnd4YwUkhbeYzdLtN6Bi36rbg4VJHFl10IvulVarMpHsv
 8B1Z2RLZdzjZxiKh7rfJXt+kPmqVPiM=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-WQ67em7JMRiNUPMDAkBUDw-1; Thu, 27 Jul 2023 05:30:47 -0400
X-MC-Unique: WQ67em7JMRiNUPMDAkBUDw-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-767edbf73cbso17470585a.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Jul 2023 02:30:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690450247; x=1691055047;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qh+q07rt8r6bDYqg41H3ezz9L7B6DNPwkct/izi2KJE=;
 b=J1MosR5x/WeiajZ5Lud6IvGcDmRB0zMy3FlvRG/l6xqUgexRYWOKF6tnWuVPssOnrY
 AFAIkzLyAXFZ22dcrRPuEidx7FfKIFPdbc6ANaYkqnNFhgAFYmLb1XOGCuw/45Z/G6av
 5a9aQJMsjSqabs/UsaYDFRRrp4MSEFV9xxDkaC+anQD3vFWy4drEmDWmtYcYItryEjUU
 NVD5Ff7Nu+4qHPBINpShdXj9eh0+Bf3yIuKPgLlJVzzUA1lL9YXub1vquj8s1aX4vdSV
 J0Ypp2HeRbvo23mQ8AqMmoQiBGWnjsnol+Q58+y/KhmQDfFgiVR9VshgNOrrgpsS7lAS
 nLOA==
X-Gm-Message-State: ABy/qLbqOfCc/Ewf4Q2O5ajuVudVtzCJt7FSd5HtYIjRfdsgBWwugJ5l
 ezJgS7gHlKYNTSl0/us5aVUadA/uTjN8K/KhJBw3TRSu2zBisDkAeaQS7tb00fpFf0irpIt3gbT
 6XMKrZ1deJT7eMsDzEkS19G1g8sMVZKrwqKrXqnOp23BbBrFM
X-Received: by 2002:a05:620a:1987:b0:765:3b58:99ab with SMTP id
 bm7-20020a05620a198700b007653b5899abmr5086305qkb.4.1690450247440; 
 Thu, 27 Jul 2023 02:30:47 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHTPmJ6ywjMXcOn37fllkuxYqQBuqUnEaMX6eyYTMzWMl4po0H4sZqAd9VzOIr31KLGtaJuDg==
X-Received: by 2002:a05:620a:1987:b0:765:3b58:99ab with SMTP id
 bm7-20020a05620a198700b007653b5899abmr5086288qkb.4.1690450247118; 
 Thu, 27 Jul 2023 02:30:47 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-238-55.dyn.eolo.it.
 [146.241.238.55]) by smtp.gmail.com with ESMTPSA id
 16-20020a05620a071000b00767cf270628sm276536qkc.131.2023.07.27.02.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 02:30:46 -0700 (PDT)
Message-ID: <220fc36ba1086c1390ba087d08561b61762c965a.camel@redhat.com>
Subject: Re: [PATCH v3] drivers: net: prevent tun_get_user() to exceed xdp
 size limits
From: Paolo Abeni <pabeni@redhat.com>
To: Jason Wang <jasowang@redhat.com>, David Ahern <dsahern@gmail.com>
Date: Thu, 27 Jul 2023 11:30:43 +0200
In-Reply-To: <CACGkMEsYzd1FphP-Ym9T9YjA9ZNBw7Mnw5xQ75dytQMJxDK3cg@mail.gmail.com>
References: <20230725155403.796-1-andrew.kanner@gmail.com>
 <CACGkMEt=Cd8J995+0k=6MT1Pj=Fk9E_r2eZREptLt2osj_H-hA@mail.gmail.com>
 <ab722ec1-ae45-af1f-b869-e7339402c852@redhat.com>
 <179979e6-eb8a-0300-5445-999b9366250a@gmail.com>
 <0c06b067-349c-9fe2-2cc3-36c149fd5277@gmail.com>
 <CACGkMEsYzd1FphP-Ym9T9YjA9ZNBw7Mnw5xQ75dytQMJxDK3cg@mail.gmail.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: syzbot+f817490f5bd20541b90a@syzkaller.appspotmail.com,
 netdev@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>,
 Jesper Dangaard Brouer <jbrouer@redhat.com>, linux-kernel@vger.kernel.org,
 edumazet@google.com, brouer@redhat.com, kuba@kernel.org,
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

T24gVGh1LCAyMDIzLTA3LTI3IGF0IDE0OjA3ICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+IE9u
IFRodSwgSnVsIDI3LCAyMDIzIGF0IDg6MjfigK9BTSBEYXZpZCBBaGVybiA8ZHNhaGVybkBnbWFp
bC5jb20+IHdyb3RlOgo+ID4gCj4gPiBPbiA3LzI2LzIzIDE6MzcgUE0sIERhdmlkIEFoZXJuIHdy
b3RlOgo+ID4gPiBPbiA3LzI2LzIzIDM6MDIgQU0sIEplc3BlciBEYW5nYWFyZCBCcm91ZXIgd3Jv
dGU6Cj4gPiA+ID4gQ2MuIEpvaG4gYW5kIEFoZXJuCj4gPiA+ID4gCj4gPiA+ID4gT24gMjYvMDcv
MjAyMyAwNC4wOSwgSmFzb24gV2FuZyB3cm90ZToKPiA+ID4gPiA+IE9uIFR1ZSwgSnVsIDI1LCAy
MDIzIGF0IDExOjU04oCvUE0gQW5kcmV3IEthbm5lcgo+ID4gPiA+ID4gPGFuZHJldy5rYW5uZXJA
Z21haWwuY29tPiB3cm90ZToKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IFN5emthbGxlciByZXBv
cnRlZCB0aGUgZm9sbG93aW5nIGlzc3VlOgo+ID4gPiA+ID4gPiA9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0KPiA+ID4gPiA+ID4gVG9vIEJJRyB4ZHAtPmZyYW1lX3N6ID0g
MTMxMDcyCj4gPiA+ID4gCj4gPiA+ID4gSXMgdGhpcyBhIGNvbnRpZ3VvdXMgcGh5c2ljYWwgbWVt
b3J5IGFsbG9jYXRpb24/Cj4gPiA+ID4gCj4gPiA+ID4gMTMxMDcyIGJ5dGVzIGVxdWFsIG9yZGVy
IDUgcGFnZS4KPiA+ID4gPiAKPiA+ID4gPiBMb29raW5nIGF0IHR1bi5jIGNvZGUgSSBjYW5ub3Qg
ZmluZCBhIGNvZGUgcGF0aCB0aGF0IGNvdWxkIGNyZWF0ZQo+ID4gPiA+IG9yZGVyLTUgc2tiLT5k
YXRhLCBidXQgb25seSBTS0Igd2l0aCBvcmRlci0wIGZyYWdtZW50cy4gIEJ1dCBJIGd1ZXNzIGl0
Cj4gPiA+ID4gaXMgdGhlIG5ldGlmX3JlY2VpdmVfZ2VuZXJpY194ZHAoKSB3aGF0IHdpbGwgcmVh
bGxvYyB0byBtYWtlIHRoaXMgbGluZWFyCj4gPiA+ID4gKHZpYSBza2JfbGluZWFyaXplKCkpCj4g
PiA+IAo+ID4gPiAKPiA+ID4gZ2V0X3R1bl91c2VyIGlzIHBhc3NlZCBhbiBpb3ZfaXRlciB3aXRo
IGEgc2luZ2xlIHNlZ21lbnQgb2YgNjUwMDcKPiA+ID4gdG90YWxfbGVuLiBUaGUgYWxsb2Nfc2ti
IHBhdGggaXMgaGl0IHdpdGggYW4gYWxpZ24gc2l6ZSBvZiBvbmx5IDY0LiBUaGF0Cj4gPiA+IGlz
IGluc3VmZmljaWVudCBmb3IgWERQIHNvIHRoZSBuZXRpZl9yZWNlaXZlX2dlbmVyaWNfeGRwIGhp
dHMgdGhlCj4gPiA+IHBza2JfZXhwYW5kX2hlYWQgcGF0aC4gU29tZXRoaW5nIGlzIG9mZiBpbiB0
aGUgbWF0aCBpbgo+ID4gPiBuZXRpZl9yZWNlaXZlX2dlbmVyaWNfeGRwIHJlc3VsdGluZyBpbiB0
aGUgc2tiIG1hcmtlcnMgYmVpbmcgb2ZmLiBUaGF0Cj4gPiA+IGNhdXNlcyBicGZfcHJvZ19ydW5f
Z2VuZXJpY194ZHAgdG8gY29tcHV0ZSB0aGUgd3JvbmcgZnJhbWVfc3ouCj4gPiAKPiA+IAo+ID4g
QlRXLCBpdCBpcyBwc2tiX2V4cGFuZF9oZWFkIHRoYXQgdHVybnMgaXQgZnJvbSBhIDY0a0IgdG8g
YSAxMjgga0IKPiA+IGFsbG9jYXRpb24uIEJ1dCB0aGUgMTI4a0IgcGFydCBpcyBub3QgcmVsZXZh
bnQgdG8gdGhlICJidWciIGhlcmUgcmVhbGx5Lgo+ID4gCj4gPiBUaGUgd2FybiBvbiBnZXR0aW5n
IHRyaXBwZWQgaW4gYnBmX3hkcF9hZGp1c3RfdGFpbCBpcyBiZWNhdXNlIHhkcAo+ID4gZ2VuZXJp
YyBwYXRoIGlzIHNrYiBiYXNlZCBhbmQgY2FuIGhhdmUgYSBmcmFtZV9zeiA+IDRrQi4gVGhhdCdz
IHdoYXQgdGhlCj4gPiBzcGxhdCBpcyBhYm91dC4KPiAKPiBPdGhlciBwb3NzaWJpbGl0eToKPiAK
PiB0dW5fY2FuX2J1aWxkX3NrYigpIGRvZXNuJ3QgY291bnQgWERQX1BBQ0tFVF9IRUFEUk9PTSB0
aGlzIG1heSBlbmQgdXAKPiB3aXRoIHByb2R1Y2luZyBhIGZyYW1lX3N6IHdoaWNoIGlzIGdyZWF0
ZXIgdGhhbiBQQUdFX1NJWkUgYXMgd2VsbCBpbgo+IHR1bl9idWlsZF9za2IoKS4KPiAKPiBBbmQg
cmV0aGluayB0aGlzIHBhdGNoLCBpdCBsb29rcyB3cm9uZyBzaW5jZSBpdCBiYXNpY2FsbHkgZHJv
cHMgYWxsCj4gcGFja2V0cyB3aG9zZSBidWZsZW4gaXMgZ3JlYXRlciB0aGFuIFBBR0VfU0laRSBz
aW5jZSBpdCBjYW4ndCBmYWxsCj4gYmFjayB0byB0dW5fYWxsb2Nfc2tiKCkuCj4gCj4gPiAKPiA+
IFBlcmhhcHMgdGhlIHNvbHV0aW9uIGlzIHRvIHJlbW92ZSB0aGUgV0FSTl9PTi4KPiAKPiBZZXMs
IHRoYXQgaXMgd2hhdCBJJ20gYXNraW5nIGlmIHRoaXMgd2FybmluZyBzdGlsbCBtYWtlcyBzZW5z
ZSBpbiBWMS4KCkkgdW5kZXJzdGFuZCB0aGUgY29uc2Vuc3VzIGlzIHNvbHZpbmcgdGhlIGlzc3Vl
IGJ5IGNoYW5naW5nL3JlbW92aW5nCnRoZSBXQVJOX09OKCkgaW4gWERQLiBJIHRoaW5rIGl0IG1h
a2VzIHNlbnNlLCBJIGd1ZXNzIHRoZSBzYW1lIHdhcm4gY2FuCmJlIHJlYWNoZWQgdmlhIHBhY2tl
dCBzb2NrZXQgeG1pdCBvbiB2ZXRoIG9yIHNpbWlsYXIgdG9wb2xvZ3kuCgpDaGVlcnMsCgpQYW9s
bwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
a2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
