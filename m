Return-Path: <SRS0=DYSW=L5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 331FFC07E99
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Jul 2021 16:35:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD42E61952
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Jul 2021 16:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD42E61952
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D3F84039D;
	Mon,  5 Jul 2021 16:35:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zIR77kw9iBhu; Mon,  5 Jul 2021 16:35:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5B2B940399;
	Mon,  5 Jul 2021 16:35:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 411B0C0010;
	Mon,  5 Jul 2021 16:35:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B99CFC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Jul 2021 16:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B7D06071A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Jul 2021 16:35:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sGx9NDBrgAqG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Jul 2021 16:35:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0652460009
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Jul 2021 16:35:03 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id s13so7418256plg.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 05 Jul 2021 09:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fJA+d5ID8q3IsTw9va0CZTFXOsFZE3rsEkxwpk4NWbM=;
 b=H5V1Lk+cSTzjUoH3HLe+PiPcr3U0ePf5/obcZHzGbuX7ko73wrzWJjIwZqtChvRk8c
 0J5s53u19WPJbISAFqiiwhenCJfGvK60bF4NXJLlSZ2ZWTfdTSrxZRIS0vbaxYUpjap6
 cQzWRzTdvXZpj13UQN6J5m0lcyTx5IpjM6WR1Vs+272JXWAoZCKObgtKKq7d2Y78BGXm
 nNKK84pHhXzzYtjSOq5syjuURF5JVc9Xy4EpCboP7VIww4rebJhfr+PeOH5AipVzzbNh
 qx6wCnL4YchmfCJW4WRKN3A1vxwX7ao6E5brYcwMBJ4JsmyCipHECJP+lyxqvGeXkS/I
 c4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fJA+d5ID8q3IsTw9va0CZTFXOsFZE3rsEkxwpk4NWbM=;
 b=QAPUndRnAgMbfaCBZWxKoXfe9svjUAk2mbukzZRbK1FI9JOJypRfSifZFuFWldHG2K
 1E14moIdC7OBJD7PfssCLcDZAwb5lNXKHpFblwLtpZMVdw/5UbOTB60LjJrrzkxiICnY
 6qYF8c52evkgP47aIym9AJJpaUt9El87A7c3+D5yOeNkmrVG1ZWVIMVZRR3j50PAMBxC
 h3dq9syHc2LT9eF88bhbAp75BN/Yn/kXOKkazRtHI8/JepPzYY9h7XzaWKEncwJmBkCq
 gFF7yxAVbDDFgSMfVn1zk+jFbtek+YeCQlqw9s6WNx/8cXDTY88e07rp4005DJGRuohg
 LHGw==
X-Gm-Message-State: AOAM530FqKKD0+PXY6SXwwLi91GKbtWryUyzvteMAmCutJegPnufZPQv
 u/Vy+dHcjoaELZlMMJoWCAc=
X-Google-Smtp-Source: ABdhPJyYnDrM6ONgbRFkp9RIr5kc0oySIgLKyHM4GePcEqZcwvV4LC194NZShXNsrrxS6D/vARkc2w==
X-Received: by 2002:a17:90a:f16:: with SMTP id 22mr21345pjy.38.1625502903374; 
 Mon, 05 Jul 2021 09:35:03 -0700 (PDT)
Received: from [192.168.93.106] (bb42-60-144-185.singnet.com.sg.
 [42.60.144.185])
 by smtp.gmail.com with ESMTPSA id u21sm13118250pfh.163.2021.07.05.09.34.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 09:35:02 -0700 (PDT)
Subject: Re: [PATCH v4] tcp: fix tcp_init_transfer() to not reset
 icsk_ca_initialized
To: Neal Cardwell <ncardwell@google.com>, David Miller <davem@davemloft.net>
References: <20210703093417.1569943-1-phind.uet@gmail.com>
 <20210703.144945.1327654903412498334.davem@davemloft.net>
 <CADVnQynxFKthexWRFRGN_9enRt7cmgrNo7mpNOMpNVm_jJpt4w@mail.gmail.com>
From: Phi Nguyen <phind.uet@gmail.com>
Message-ID: <ea882927-a6f6-6d26-66bd-442d03ac3ea0@gmail.com>
Date: Tue, 6 Jul 2021 00:34:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CADVnQynxFKthexWRFRGN_9enRt7cmgrNo7mpNOMpNVm_jJpt4w@mail.gmail.com>
Content-Language: en-US
Cc: songliubraving@fb.com,
 syzbot+f1e24a0594d4e3a895d3@syzkaller.appspotmail.com, daniel@iogearbox.net,
 yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, dsahern@kernel.org,
 john.fastabend@gmail.com, ast@kernel.org, andrii@kernel.org,
 edumazet@google.com, yyd@google.com, ycheng@google.com, kuba@kernel.org,
 kpsingh@kernel.org, yhs@fb.com, bpf@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, kafai@fb.com,
 linux-kernel@vger.kernel.org
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

T24gNy80LzIwMjEgOTo1MiBQTSwgTmVhbCBDYXJkd2VsbCB3cm90ZToKPiAKPiAKPiBPbiBTYXQs
IEp1bCAzLCAyMDIxIGF0IDU6NDkgUE0gRGF2aWQgTWlsbGVyIDxkYXZlbUBkYXZlbWxvZnQubmV0
IAo+IDxtYWlsdG86ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD4+IHdyb3RlOgo+ICA+Cj4gID4gRnJvbTog
Tmd1eWVuIERpbmggUGhpIDxwaGluZC51ZXRAZ21haWwuY29tIDxtYWlsdG86cGhpbmQudWV0QGdt
YWlsLmNvbT4+Cj4gID4gRGF0ZTogU2F0LCDCoDMgSnVsIDIwMjEgMTc6MzQ6MTcgKzA4MDAKPiAg
Pgo+ICA+ID4gZGlmZiAtLWdpdCBhL25ldC9pcHY0L3RjcF9pbnB1dC5jIGIvbmV0L2lwdjQvdGNw
X2lucHV0LmMKPiAgPiA+IGluZGV4IDdkNWU1OWY2ODhkZS4uODU1YWRhMmJlMjVlIDEwMDY0NAo+
ICA+ID4gLS0tIGEvbmV0L2lwdjQvdGNwX2lucHV0LmMKPiAgPiA+ICsrKyBiL25ldC9pcHY0L3Rj
cF9pbnB1dC5jCj4gID4gPiBAQCAtNTkyMiw3ICs1OTIyLDYgQEAgdm9pZCB0Y3BfaW5pdF90cmFu
c2ZlcihzdHJ1Y3Qgc29jayAqc2ssIGludCAKPiBicGZfb3AsIHN0cnVjdCBza19idWZmICpza2Ip
Cj4gID4gPiDCoCDCoCDCoCDCoCDCoCDCoCDCoCB0cC0+c25kX2N3bmQgPSB0Y3BfaW5pdF9jd25k
KHRwLCBfX3NrX2RzdF9nZXQoc2spKTsKPiAgPiA+IMKgIMKgIMKgIHRwLT5zbmRfY3duZF9zdGFt
cCA9IHRjcF9qaWZmaWVzMzI7Cj4gID4gPgo+ICA+ID4gLSDCoCDCoCBpY3NrLT5pY3NrX2NhX2lu
aXRpYWxpemVkID0gMDsKPiAgPiA+IMKgIMKgIMKgIGJwZl9za29wc19lc3RhYmxpc2hlZChzaywg
YnBmX29wLCBza2IpOwo+ICA+ID4gwqAgwqAgwqAgaWYgKCFpY3NrLT5pY3NrX2NhX2luaXRpYWxp
emVkKQo+ICA+ID4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgdGNwX2luaXRfY29uZ2VzdGlvbl9jb250
cm9sKHNrKTsKPiAgPgo+ICA+IERvbid0IHlvdSBoYXZlIHRvIG1ha2UgdGhlIHRjcF9pbml0X2Nv
bmdlc3Rpb25fY29udHJvbCgpIGNhbGwgCj4gdW5jb25kaXRpb25hbCBub3c/Cj4gCj4gSSB0aGlu
ayB3ZSB3YW50IHRvIGtlZXAgaXQgY29uZGl0aW9uYWwsIHRvIGF2b2lkIGRvdWJsZS1pbml0aWFs
aXphdGlvbiAKPiBpZiB0aGUgQlBGIGNvZGUgc2V0cyB0aGUgY29uZ2VzdGlvbiBjb250cm9sIGFs
Z29yaXRobSBhbmQgaW5pdGlhbGl6ZXMgCj4gaXQuIEJ1dCB0aGF0J3MgcmVsYXRpdmVseSBuZXcg
YW5kIHN1YnRsZSwgc28gaXQgbWlnaHQgYmUgbmljZSBmb3IgdGhpcyAKPiBwYXRjaCB0byBhZGQg
YSBjb21tZW50IGFib3V0IHRoYXQsIHNpbmNlIGl0J3MgdG91Y2hpbmcgdGhpcyBwYXJ0IG9mIHRo
ZSAKPiBjb2RlIGFueXdheToKPiAKPiAtwqAgwqAgwqAgwqBpY3NrLT5pY3NrX2NhX2luaXRpYWxp
emVkID0gMDsKPiAgwqAgwqAgwqAgwqAgYnBmX3Nrb3BzX2VzdGFibGlzaGVkKHNrLCBicGZfb3As
IHNrYik7Cj4gK8KgIMKgIMKgIMKgLyogSW5pdGlhbGl6ZSBjb25nZXN0aW9uIGNvbnRyb2wgdW5s
ZXNzIGEgQlBGIG9wIGluaXRpYWxpemVkIGl0IAo+IGFscmVhZHk6ICovCj4gIMKgIMKgIMKgIMKg
IGlmICghaWNzay0+aWNza19jYV9pbml0aWFsaXplZCkKPiAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgdGNwX2luaXRfY29uZ2VzdGlvbl9jb250cm9sKHNrKTsKPiAKPiBuZWFsCj4gCkkgd2lsbCBt
YWtlIGEgbmV3IHZlcnNpb24gd2l0aCB5b3VyIGNvbW1lbnQuClRoYW5rIHlvdSB2ZXJ5IG11Y2gg
Zm9yIGhlbHBpbmcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVl
c0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9u
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
