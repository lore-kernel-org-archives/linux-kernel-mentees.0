Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9D5C00528
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 31 Jul 2023 15:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 017E041759;
	Mon, 31 Jul 2023 15:47:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 017E041759
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fSwFWkvh
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ioqEcyrQXqQ; Mon, 31 Jul 2023 15:47:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8C66C41745;
	Mon, 31 Jul 2023 15:47:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C66C41745
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6F338C0071;
	Mon, 31 Jul 2023 15:47:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0951AC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 15:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3DAF81E51
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 15:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3DAF81E51
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=fSwFWkvh
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HbKLXmrycP2G
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 15:47:24 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54D7B81E4F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 15:47:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54D7B81E4F
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fe28f92d8eso2951855e87.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 08:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690818442; x=1691423242;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ABZh1xz4n6wuJf1UZhlFRWHEBKIhLTjdbX5I0EQWrCs=;
 b=fSwFWkvhfCC6nHRRWXxDB0k59t7O9AYCvs+ae07YpC7D6PcxOp7BdFPLNtWeGb4Fdz
 wGHX0O86FGkl3r7hPwNaGSL8yPtLD0a995rOr64KRFzOodWqKD53z0pdEmXcS0ECkBHB
 tVxaJy2KHqLL31jRxlsQz15+yuZx4/wcK0DeDJHMIJiecc3RFcZEt8e/kXd2duxPH2GJ
 QJMFDXWWPuWw3+LPBncbkiax3Zs1LivJUK3j5uyssFaAgiNGgerQ6cNN1cWnS7o9dVr2
 4iignrmbEAntlYFXzebve04wmC65Xv1oq3nEhFEibh37R77U0vR9xbSH+ldd1Ln/6f5G
 D5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690818442; x=1691423242;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ABZh1xz4n6wuJf1UZhlFRWHEBKIhLTjdbX5I0EQWrCs=;
 b=FXUoNwO6GDUZqpnlI/fbtodJw2mq52r243ovrYTgQLyhtYeWOb1jZE/77uY0hJj9gO
 zZmq7suP6x9m5o0b5pT8xB2ZoyubwVCOVl89zitjyjPOY1RKzdJ8hhfqEIeujPqq5I6o
 IG9/tiVnbUPlQTUzsW+yS+vF7ATiLTZYsK1ARLD4P8/aIvc2l17eIt8c9KISbott/Z0A
 yWKVSXout60EewCmg60E48lYrX+wPpr6DWw/OVenZ/rpSxqh0JuatllRnZkqMykx69sW
 FA8BDCyX1A8t3GKh+TVc3vPb4mpu8FeByCQ/x1XLcrXiGVdXILBClf+t9TtcQaZvz9Ic
 x3Dw==
X-Gm-Message-State: ABy/qLb09rLZpk7kARfML8T+9c1ihOY3pYbeKBtAutM/v6GSX585+LSo
 54v6M85y9Xa6vhydr4KScuw=
X-Google-Smtp-Source: APBJJlHev/F2QvCssa3rzFT8WFT/xaYyjd6AmItAIopq/blmw1EN/cScn24nT8oET8fR0vJl1FcXDg==
X-Received: by 2002:a19:4f54:0:b0:4fb:89f2:278e with SMTP id
 a20-20020a194f54000000b004fb89f2278emr149583lfk.68.1690818441527; 
 Mon, 31 Jul 2023 08:47:21 -0700 (PDT)
Received: from akanner-r14. ([77.222.27.66]) by smtp.gmail.com with ESMTPSA id
 z21-20020a19f715000000b004fdc6f03c6dsm2119808lfe.37.2023.07.31.08.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 08:47:20 -0700 (PDT)
Message-ID: <64c7d788.190a0220.3c2cf.5d7f@mx.google.com>
X-Google-Original-Message-ID: <ZMfXhFYDHKnqn7cX@akanner-r14.>
Date: Mon, 31 Jul 2023 18:47:16 +0300
From: Andrew Kanner <andrew.kanner@gmail.com>
To: David Ahern <dsahern@gmail.com>
Subject: Re: [PATCH v3] drivers: net: prevent tun_get_user() to exceed xdp
 size limits
References: <20230725155403.796-1-andrew.kanner@gmail.com>
 <CACGkMEt=Cd8J995+0k=6MT1Pj=Fk9E_r2eZREptLt2osj_H-hA@mail.gmail.com>
 <ab722ec1-ae45-af1f-b869-e7339402c852@redhat.com>
 <179979e6-eb8a-0300-5445-999b9366250a@gmail.com>
 <0c06b067-349c-9fe2-2cc3-36c149fd5277@gmail.com>
 <CACGkMEsYzd1FphP-Ym9T9YjA9ZNBw7Mnw5xQ75dytQMJxDK3cg@mail.gmail.com>
 <220fc36ba1086c1390ba087d08561b61762c965a.camel@redhat.com>
 <3659ea35-8d03-aae7-53c0-09181bb1b69d@redhat.com>
 <64c30249.2e0a0220.f779a.1c31@mx.google.com>
 <cf1ef905-fa48-df3a-2d3c-37d7a1e79b8e@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cf1ef905-fa48-df3a-2d3c-37d7a1e79b8e@gmail.com>
Cc: syzbot+f817490f5bd20541b90a@syzkaller.appspotmail.com,
 netdev@vger.kernel.org, Jason Wang <jasowang@redhat.com>,
 John Fastabend <john.fastabend@gmail.com>, linux-kernel@vger.kernel.org,
 Jesper Dangaard Brouer <jbrouer@redhat.com>, edumazet@google.com,
 brouer@redhat.com, kuba@kernel.org, Paolo Abeni <pabeni@redhat.com>,
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

T24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgMDY6MTE6NTdQTSAtMDYwMCwgRGF2aWQgQWhlcm4gd3Jv
dGU6Cj4gT24gNy8yNy8yMyA1OjQ4IFBNLCBBbmRyZXcgS2FubmVyIHdyb3RlOgo+ID4gCj4gPiBU
aGFua3MsIGV2ZXJ5b25lLgo+ID4gCj4gPiBJZiB3ZSBzdW1tYXJpemUgdGhlIGRpc2N1c3Npb24g
LSB0aGVyZSBhcmUgMyBpc3N1ZXMgaGVyZToKPiA+IDEuIHR1bl9jYW5fYnVpbGRfc2tiKCkgZG9l
c24ndCBjb3VudCBYRFBfUEFDS0VUX0hFQURST09NIChtaW5vciBhbmQKPiA+ICAgIG1vc3QgdHJp
dmlhbCkKPiA+IDIuIFdBUk5fT05fT05DRSBmcm9tIG5ldC9jb3JlL2ZpbHRlci5jLCB3aGljaCBt
YXkgYmUgdG9vIHN0cmljdCAvIG5vdAo+ID4gICAgbmVlZGVkIGF0IGFsbC4KPiA+IDMuIHN0cmFu
Z2UgYmVoYXZpb3VyIHdpdGggcmVhbGxvY2F0aW9uZyBTS0IgKDY1MDA3IC0+IDEzMTA3MikKPiAK
PiBJIGJlbGlldmUgdGhhdCBoYXBwZW5zIGJlY2F1c2Ugb2YgdGhlIGN1cnJlbnQgc2tiIHNpemUg
YW5kIHRoZSBuZWVkIHRvCj4gZXhwYW5kIGl0IHRvIGFjY291bnQgZm9yIHRoZSBYRFAgaGVhZHJv
b20gbWFrZXMgdGhlIGFsbG9jYXRpb24gZ28gb3Zlcgo+IDY0a0IuIFNpbmNlIHR1biBpcyBnaXZl
biB0aGUgcGFja2V0IHZpYSBhIHdyaXRlIGNhbGwgdGhlcmUgYXJlIG5vIGhlYWRlcgo+IG1hcmtl
cnMgdG8gYWxsb2NhdGUgc2VwYXJhdGUgc3BhY2UgZm9yIGhlYWRlcnMgYW5kIGRhdGEgKGUuZy4g
bGlrZSBUQ1AKPiBkb2VzIHdpdGggMzJrQiBkYXRhIHNlZ21lbnRzKS4KCgpZZXMsIHRoaXMgaXMg
ZXhhY3RseSB3aGF0IHlvdSBzdXNwZWN0ZWQuIEluIHBza2JfZXhwYW5kX2hlYWQoKSAtPgprbWFs
bG9jX3Jlc2VydmUoKSBJIGhhdmUgdGhlc2UgdmFsdWVzIGluaXRpYWxseToKKGdkYikgcCAqc2l6
ZQokMTMgPSA2NTQwOAooZ2RiKSBwIG9ial9zaXplCiQxNiA9IDY1NzI4CgphbmQgaXQgd2lsbCBk
bzoKICAgIGRhdGEgPSBrbWFsbG9jX3Jlc2VydmUoJnNpemUsIGdmcF9tYXNrLCBOVU1BX05PX05P
REUsIE5VTEwpOwouLi4KCW9ial9zaXplID0gU0tCX0hFQURfQUxJR04oKnNpemUpOwouLi4KCSpz
aXplID0gb2JqX3NpemUgPSBrbWFsbG9jX3NpemVfcm91bmR1cChvYmpfc2l6ZSk7CgooZ2RiKSBw
ICpzaXplCiQyMiA9IDEzMTA3MgoKU28gdGhpcyBpcyBrbWFsbG9jX3NpemVfcm91bmR1cCgpIGRv
aW5nIHRoaXMgbWF0aCB3aXRoIHRoZSBmb2xsb3dpbmc6CiAgIC8qIEFib3ZlIHRoZSBzbWFsbGVy
IGJ1Y2tldHMsIHNpemUgaXMgYSBtdWx0aXBsZSBvZiBwYWdlIHNpemUuICovICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg4pSC
CiAgIGlmIChzaXplID4gS01BTExPQ19NQVhfQ0FDSEVfU0laRSkgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAg4pSCCiAgICAgIHJldHVybiBQQUdFX1NJWkUgPDwgZ2V0X29y
ZGVyKHNpemUpOwoKPiA+IAo+ID4gSSBjYW4gY2hlY2sgdGhlc2UgaXNzdWVzLiBJIGhhdmUgdG8g
ZGl2ZSBhIGxpdHRsZSBkZWVwZXIgd2l0aCAyLTMsCj4gPiBtb3N0IGxpa2VseSB3aXRoIGtnZGIg
YW5kIHN5emthbGxlciByZXByby4gQnV0IHNlZW1zIHRoaXMgaXMgbm90Cj4gPiBzb21ld2hhdCB1
cmdlbnQgYW5kIGxpdmVzIHF1aXRlIGEgbG9uZyB0aW1lIHdpdGhvdXQgYmVpbmcgbm90aWNlZC4K
PiA+IAo+ID4gQlRXOiBBdHRhY2hlZCB0aGUgZnRyYWNlIGxvZ3MgdXNpbmcgdGhlIG9yaWdpbmFs
IHN5emthbGxlciByZXBybwo+ID4gKHN0YXJ0aW5nIHdpdGggdHVuX2dldF91c2VyKCkpLiBUaGV5
IGFuc3dlciBKZXNwZXIncyBxdWVzdGlvbiBhYm91dAo+ID4gY29udGlndW91cyBwaHlzaWNhbCBt
ZW1vcnkgYWxsb2NhdGlvbiAoa21lbV9jYWNoZV9hbGxvY19ub2RlKCkgLwo+ID4ga21hbGxvY19y
ZXNlcnZlKCkpLiBCdXQgSSdsbCBjaGVjayBpdCBvbmUgbW9yZSB0aW1lIGJlZm9yZSBzdWJtaXR0
aW5nCj4gPiBhIG5ldyBQQVRDSCBWNCBvciBhbm90aGVyIHBhdGNoIC8gcGF0Y2ggc2VyaWVzLgo+
ID4gCj4gCgpJIHNlZSBubyBvdGhlciBidWdzIGluIG1hdGgsIHNvIG5vdCBzdXJlIHdldGhlciBp
dCBzaG91bGQgYmUgZml4ZWQuIElzCml0IG9rIGFuZCBleHBlY3RlZCB0byByb3VuZHVwIHRoZSBt
ZW1vcnkgYWxsb2NhdGlvbj8KCgotLSAKQW5kcmV3IEthbm5lcgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5n
IGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJu
ZWwtbWVudGVlcwo=
