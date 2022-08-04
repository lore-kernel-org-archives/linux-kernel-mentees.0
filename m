Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEDCC19F29
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  4 Aug 2022 03:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EA8B60B5B;
	Thu,  4 Aug 2022 03:07:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EA8B60B5B
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gmV7O6gv
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Iv9unjBWl-lU; Thu,  4 Aug 2022 03:07:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 51EE460B0F;
	Thu,  4 Aug 2022 03:07:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51EE460B0F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22FE8C0032;
	Thu,  4 Aug 2022 03:07:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 92061C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 03:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 596A660B0F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 03:07:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 596A660B0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zPvKP3Ms-nyr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 03:07:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 875ED60B5B
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 875ED60B5B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 03:07:16 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id g12so18207792pfb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 03 Aug 2022 20:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=OatUP4rKx+f2k6sv6SpcwdsysXb7D++KfTGUd92YzvM=;
 b=gmV7O6gvZgtLqZhBEeoWOXh3PB0+zkVmCCT6nsoqdCJf7Prj4hL/yp9jgKI/YAtPzw
 IzG80HVr9P1EtIrKRJ90QQe9HYwsFmZR+MViKbNdgeWe6f/pO/z1RpuLsOBSLwMefYg1
 +4KAYtJKqfONpkkVzVaPMDzgL7eEK2O8qWnbATOxscjKWNHXpetfpYiFxyRsXlLjdeAz
 Ay1N/69TZJW6RKcAfuenKTGxwk0KoJdctjTtXfgIouDDZ+90hkbyzOaf859pHHvRmLv4
 mPbE8Rf6sXt2KNYG+fnlxR6qnadVD3CuA9tMhGyKSYCfRpZNg4bXGe7tcykGv2sFtRr6
 GM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=OatUP4rKx+f2k6sv6SpcwdsysXb7D++KfTGUd92YzvM=;
 b=Ui6H4fsfjzgsbvVSY0eR+UxqIl5O2vBbEkglRpFvcogSXVEBi22YiG1+rM/xNmAtrc
 3cuw+eVEcWcEgDaVKCFEM/GyG0NPnAIu6577N6wbvuVm4hDiVOx2aeK4bdLZ8ZvS1XQW
 POPwfQvfUz/SnF4jrR/Rwt3GZkws7pLvJ6uMNuIMpLdkwmNxTZNDv6PKfYRasSKGZ49l
 aNE24LYCeap3EX+JBerlz1ssE5Lrko3e1GWV8si1OT47idsbPLgMCrC5NT15IYm5Rnsg
 /+WUDeQwjPSii0C1TGIIg77XSVTXGjDkuP7E0/7eKwR9UToZUndV4y5HUReDQLXUfWR7
 nunA==
X-Gm-Message-State: ACgBeo01z9BIfUw4+Y2/n2okG1fl3CLudVwDGznWJQjVLpSgyR1LQy5t
 NPd0Z1sjL9+tlFq71948LYI=
X-Google-Smtp-Source: AA6agR5OYfmxlNz5L/Fh+E6App0P7yGi5uWLpFGu2JrMbeuktY9eOdlQ4FrBj/LVcfxdM/2a0+JXog==
X-Received: by 2002:a65:6d97:0:b0:41c:1e06:3ba4 with SMTP id
 bc23-20020a656d97000000b0041c1e063ba4mr13729414pgb.282.1659582435835; 
 Wed, 03 Aug 2022 20:07:15 -0700 (PDT)
Received: from localhost ([223.104.103.89]) by smtp.gmail.com with ESMTPSA id
 w9-20020a628209000000b0052e594064a8sm863246pfd.220.2022.08.03.20.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 20:07:15 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: kafai@fb.com
Subject: Re: [PATCH v4] net: fix refcount bug in sk_psock_get (2)
Date: Thu,  4 Aug 2022 11:05:15 +0800
Message-Id: <20220804030514.7118-1-yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220803153706.oo47lv3kvkpb7yem@kafai-mbp.dhcp.thefacebook.com>
References: <20220803153706.oo47lv3kvkpb7yem@kafai-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Cc: songliubraving@fb.com, yhs@fb.com, ast@kernel.org, edumazet@google.com,
 jakub@cloudflare.com, daniel@iogearbox.net, borisp@nvidia.com,
 paskripkin@gmail.com, john.fastabend@gmail.com, andrii@kernel.org,
 kuba@kernel.org, pabeni@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+5f26f85569bd179c18ce@syzkaller.appspotmail.com, yin31149@gmail.com,
 syzkaller-bugs@googlegroups.com, kpsingh@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, guwen@linux.alibaba.com,
 bpf@vger.kernel.org, kgraul@linux.ibm.com
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

T24gV2VkLCAzIEF1ZyAyMDIyIGF0IDIzOjM3LCBNYXJ0aW4gS2FGYWkgTGF1IDxrYWZhaUBmYi5j
b20+IHdyb3RlOgo+ID4gPiArICogU0tfVVNFUl9EQVRBX0JQRiAgICAtIE1hbmFnZWQgYnkgQlBG
Cj4gPgo+ID4gSSdkIHVzZSB0aGlzIG9wcG9ydHVuaXR5IHRvIGFkZCBtb3JlIGluZm8gaGVyZSwg
QlBGIGlzIHRvbyBnZW5lcmFsLgo+ID4gTWF5YmUgIlBvaW50ZXIgaXMgdXNlZCBieSBhIEJQRiBy
ZXVzZXBvcnQgYXJyYXkiPyBNYXJ0aW4sIFdEWVQ/Cj4gU0dUTS4gIFRoYW5rcy4KT0suIEl0IHNl
ZW1zIHRoYXQgdGhpcyBmbGFnIGlzIGludHJvZHVjZWQgZnJvbQpjOWEzNjhmMWMwZmIgKCJicGY6
IG5ldDogQXZvaWQgaW5jb3JyZWN0IGJwZl9za19yZXVzZXBvcnRfZGV0YWNoIGNhbGwiKS4KSSB3
aWxsIHNlYXJjaCBmb3IgbW9yZSBkZXRhaWxlZCBkZXNjcmlwdGlvbiBpbiB0aGlzIGNvbW1pdC4K
Cj4gPgo+ID4gPiArLyoqCj4gPiA+ICsgKiByY3VfZGVyZWZlcmVuY2Vfc2tfdXNlcl9kYXRhX3Bz
b2NrIC0gcmV0dXJuIHBzb2NrIGlmIHNrX3VzZXJfZGF0YQo+ID4gPiArICogcG9pbnRzIHRvIHRo
ZSBwc29jayB0eXBlKFNLX1VTRVJfREFUQV9QU09DSyBmbGFnIGlzIHNldCksIG90aGVyd2lzZQo+
ID4gPiArICogcmV0dXJuIE5VTEwKPiA+ID4gKyAqCj4gPiA+ICsgKiBAc2s6IHNvY2tldAo+ID4g
PiArICovCj4gPiA+ICtzdGF0aWMgaW5saW5lCj4gPiA+ICtzdHJ1Y3Qgc2tfcHNvY2sgKnJjdV9k
ZXJlZmVyZW5jZV9za191c2VyX2RhdGFfcHNvY2soY29uc3Qgc3RydWN0IHNvY2sgKnNrKQo+ID4K
PiA+IG5pdDogdGhlIHJldHVybiB0eXBlIG1vcmUgY29tbW9ubHkgZ29lcyBvbiB0aGUgc2FtZSBs
aW5lIGFzICJzdGF0aWMKPiA+IGlubGluZSIKT2suIEkgd2lsbCBjb3JyZWN0IGl0LgoKPiA+Cj4g
PiA+ICt7Cj4gPiA+ICsgwqAgwqAgdWludHB0cl90IF9fdG1wID0gKHVpbnRwdHJfdClyY3VfZGVy
ZWZlcmVuY2UoX19za191c2VyX2RhdGEoKHNrKSkpOwo+ID4gPiArCj4gPiA+ICsgwqAgwqAgaWYg
KF9fdG1wICYgU0tfVVNFUl9EQVRBX1BTT0NLKQo+ID4gPiArIMKgIMKgIMKgIMKgIMKgIMKgIHJl
dHVybiAoc3RydWN0IHNrX3Bzb2NrICopKF9fdG1wICYgU0tfVVNFUl9EQVRBX1BUUk1BU0spOwo+
ID4gPiArCj4gPiA+ICsgwqAgwqAgcmV0dXJuIE5VTEw7Cj4gPiA+ICt9Cj4gPgo+ID4gQXMgYSBm
b2xsb3cgdXAgd2UgY2FuIHByb2JhYmx5IGdlbmVyYWxpemUgdGhpcyBpbnRvCj4gPiDCoF9fcmN1
X2RlcmVmZXJlbmNlX3NrX3VzZXJfZGF0YV9jb25kKHNrLCBiaXQpCj4gPgo+ID4gYW5kIG1ha2Ug
dGhlIHBzb2NrIGp1c3QgY2FsbCB0aGF0Ogo+ID4KPiA+IHN0YXRpYyBpbmxpbmUgc3RydWN0IHNr
X3Bzb2NrICoKPiA+IHJjdV9kZXJlZmVyZW5jZV9za191c2VyX2RhdGFfcHNvY2soY29uc3Qgc3Ry
dWN0IHNvY2sgKnNrKQo+ID4gewo+ID4gwqAgwqAgwqAgwqAgcmV0dXJuIF9fcmN1X2RlcmVmZXJl
bmNlX3NrX3VzZXJfZGF0YV9jb25kKHNrLCBTS19VU0VSX0RBVEFfUFNPQ0spOwo+ID4gfQpZZXMu
IEkgd2lsbCByZWZhY3RvciBpdCBpbiB0aGlzIHdheS4KCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2tl
cm5lbC9icGYvcmV1c2Vwb3J0X2FycmF5LmMgYi9rZXJuZWwvYnBmL3JldXNlcG9ydF9hcnJheS5j
Cj4gPiBpbmRleCBlMjYxOGZiNTg3MGUuLmFkNWM0NDdhNjkwYyAxMDA2NDQKPiA+IC0tLSBhL2tl
cm5lbC9icGYvcmV1c2Vwb3J0X2FycmF5LmMKPiA+ICsrKyBiL2tlcm5lbC9icGYvcmV1c2Vwb3J0
X2FycmF5LmMKPiA+IEBAIC0yMSwxNCArMjEsMTEgQEAgc3RhdGljIHN0cnVjdCByZXVzZXBvcnRf
YXJyYXkgKnJldXNlcG9ydF9hcnJheShzdHJ1Y3QgYnBmX21hcCAqbWFwKQo+ID4gwqAvKiBUaGUg
Y2FsbGVyIG11c3QgaG9sZCB0aGUgcmV1c2Vwb3J0X2xvY2sgKi8KPiA+IMKgdm9pZCBicGZfc2tf
cmV1c2Vwb3J0X2RldGFjaChzdHJ1Y3Qgc29jayAqc2spCj4gPiDCoHsKPiA+IC0gwqAgwqAgwqAg
dWludHB0cl90IHNrX3VzZXJfZGF0YTsKPiA+ICsgwqAgwqAgwqAgc3RydWN0IHNvY2sgX19yY3Ug
Kipzb2NrczsKPiA+Cj4gPiDCoCDCoCDCoCDCoCB3cml0ZV9sb2NrX2JoKCZzay0+c2tfY2FsbGJh
Y2tfbG9jayk7Cj4gPiAtIMKgIMKgIMKgIHNrX3VzZXJfZGF0YSA9ICh1aW50cHRyX3Qpc2stPnNr
X3VzZXJfZGF0YTsKPiA+IC0gwqAgwqAgwqAgaWYgKHNrX3VzZXJfZGF0YSAmIFNLX1VTRVJfREFU
QV9CUEYpIHsKPiA+IC0gwqAgwqAgwqAgwqAgwqAgwqAgwqAgc3RydWN0IHNvY2sgX19yY3UgKipz
b2NrczsKPiA+IC0KPiA+IC0gwqAgwqAgwqAgwqAgwqAgwqAgwqAgc29ja3MgPSAodm9pZCAqKShz
a191c2VyX2RhdGEgJiBTS19VU0VSX0RBVEFfUFRSTUFTSyk7Cj4gPiArIMKgIMKgIMKgIHNvY2tz
ID0gX19yY3VfZGVyZWZlcmVuY2Vfc2tfdXNlcl9kYXRhX2NvbmQoc2ssIFNLX1VTRVJfREFUQV9C
UEYpOwo+ID4gKyDCoCDCoCDCoCBpZiAoc29ja3MpIHsKPiA+IMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIFdSSVRFX09OQ0Uoc2stPnNrX3VzZXJfZGF0YSwgTlVMTCk7Cj4gPiDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCAvKgo+ID4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqIERvIG5vdCBtb3Zl
IHRoaXMgTlVMTCBhc3NpZ25tZW50IG91dHNpZGUgb2YKPiA+Cj4gPgo+ID4gQnV0IHRoYXQgbXVz
dCBiZSBhIHNlcGFyYXRlIHBhdGNoLCBub3QgcGFydCBvZiB0aGlzIGZpeC4KSSB3b25kZXIgaWYg
aXQgaXMgcHJvcGVyIHRvIGdhdGhlciB0aGVzZSB0b2dldGhlciBpbiBhIHBhdGNoc2V0LCBmb3IK
dGhleSBhcmUgYWxsIGFib3V0IGZsYWdzIGluIHNrX3VzZXJfZGF0YSwgbWF5YmU6CgpbUEFUQ0gg
djUgMC8yXSBuZXQ6IGVuaGFuY2VtZW50IHRvIGZsYWdzIGluIHNrX3VzZXJfZGF0YSBmaWVsZAoJ
LSBpbnRyb2R1Y2UgdGhlIHBhdGNoc2V0CgpbUEFUQ0ggdjUgMS8yXSBuZXQ6IGNsZWFuIHVwIGNv
ZGUgZm9yIGZsYWdzIGluIHNrX3VzZXJfZGF0YSBmaWVsZAoJLSByZWZhY3RvciB0aGUgdGhpbmdz
IGluIGluY2x1ZGUvbGludXgvc2ttc2cuaCBhbmQKaW5jbHVkZS9uZXQvc29jay5oCgktIHJlZmFj
dG9yIHRoZSBmbGFncydzIHVzYWdlIGJ5IG90aGVyIGNvZGUsIHN1Y2ggYXMKbmV0L2NvcmUvc2tt
c2cuYyBhbmQga2VybmVsL2JwZi9yZXVzZXBvcnRfYXJyYXkuYwoKW1BBVENIIHY1IDIvMl0gbmV0
OiBmaXggcmVmY291bnQgYnVnIGluIHNrX3Bzb2NrX2dldCAoMikKCS0gYWRkIFNLX1VTRVJfREFU
QV9QU09DSyBmbGFnIGluIHNrX3VzZXJfZGF0YSBmaWVsZApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxp
c3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwt
bWVudGVlcwo=
