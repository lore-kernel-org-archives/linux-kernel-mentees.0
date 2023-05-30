Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C49C77B73
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 30 May 2023 14:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CDC160D90;
	Tue, 30 May 2023 14:59:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CDC160D90
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=qAfqcXDX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3umfggEYWvEG; Tue, 30 May 2023 14:59:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 00F5860BFE;
	Tue, 30 May 2023 14:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00F5860BFE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D52FFC0037;
	Tue, 30 May 2023 14:59:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1260C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 May 2023 14:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BED78216A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 May 2023 14:59:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BED78216A
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=qAfqcXDX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LrcOLdG2xS15
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 May 2023 14:59:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0483682169
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0483682169
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 May 2023 14:59:54 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f4d80bac38so5008732e87.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 May 2023 07:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685458792; x=1688050792;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1prAZbqiTg1dUFwezGXTXOfntLGDRSTqatzd2KUWUkM=;
 b=qAfqcXDXsFzOvvu2d5Vm23SgBXCDAIPexQLTuSUvo2jiT3c5AGAQbHyp+LTBSIEB6J
 oq69r1dEaMyL0gh+6vs8pfSk5JET37Nv9+EJNRIoZb2NbeJ3kxh/IAZl1lqtBvE7bhd8
 YPlwzeQaXHH9nmfqYlNRZulayU1LtMSsr+FNgobWWxDay/ZuMWV34rU9G7DQWbJY9mgu
 r3oPL6ubOJ54iMSAxqtUYI/8c48OhwsYimexGzbD4tkxtUiOZFlZcvuzMBnTw5mTYYbn
 QpbvBcGoznjnvmFkhVXUYx/lq5iSHNhGV6uGbb0Fk2O3i8wlfEZZCRs/6hhcuhjdNMcK
 KXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685458792; x=1688050792;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1prAZbqiTg1dUFwezGXTXOfntLGDRSTqatzd2KUWUkM=;
 b=Zr0IpTaOvhqDUtN3o/UK0UpnGZJTL3ACzBHfYeqI6QHqZ183yVzUFL7oQ/pn4zAH5P
 9letB1s/OlQ4+jZFuoSP/S6VtkJ0J8zQMsNQPEAPFd/SlZEJiD+efFaOFzIomCbUwYfm
 /+OoX5fKsIqv1YZRTntK5Axqso8TXld9fNs/lmmUEuAF6RRFADtkkfMKCpZgTakDtGz3
 0td+rqtAQ7jn51806vxwg2i+bkfl1vA9cbo59WsqJfTLK1Eo0L0Dgnam1N9PbhGLaqyP
 89+yT3kJd/7N8PctpATZA9ciUY4Kcw+bp5grRDU8/lRBx1lMBnLi0zk8JmkAYwkl1uH7
 R8QQ==
X-Gm-Message-State: AC+VfDxQ43Xj3XPe3qJ5Mi748OrY5rvVfm/prZXvrMAsNrrJ0D6A0iZh
 BkQT3TX541LCqJmp4yfCtkcz9TWyOWRrP+jUbVo=
X-Google-Smtp-Source: ACHHUZ4mG8DNk4l47Mpye1DcAycjCan2ubhYQDjtSsdDSAFpg0u7Y3GTl59+KL6DQdTEK4jfAhHYu6y33RsnFhmahHc=
X-Received: by 2002:a05:651c:87:b0:2a7:6e37:ee68 with SMTP id
 7-20020a05651c008700b002a76e37ee68mr934133ljq.12.1685458792213; Tue, 30 May
 2023 07:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000cafb9305fc4fe588@google.com>
 <20230528184422.596947-1-princekumarmaurya06@gmail.com>
 <20230530-zenit-radeln-06417ce5fe85@brauner>
In-Reply-To: <20230530-zenit-radeln-06417ce5fe85@brauner>
From: Prince Kumar Maurya <princekumarmaurya06@gmail.com>
Date: Tue, 30 May 2023 07:59:16 -0700
Message-ID: <CAF0B0eKxMf7-uzgRJcWsWW6hgxP25bPG8U9nF0by7mSNvhZmbQ@mail.gmail.com>
Subject: Re: [PATCH v3] fs/sysv: Null check to prevent null-ptr-deref bug
To: Christian Brauner <brauner@kernel.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 chenzhongjin@huawei.com, syzbot+aad58150cbc64ba41bdc@syzkaller.appspotmail.com
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

T24gVHVlLCBNYXkgMzAsIDIwMjMgYXQgMToyNuKAr0FNIENocmlzdGlhbiBCcmF1bmVyIDxicmF1
bmVyQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gU3VuLCBNYXkgMjgsIDIwMjMgYXQgMTE6NDQ6
MjJBTSAtMDcwMCwgUHJpbmNlIEt1bWFyIE1hdXJ5YSB3cm90ZToKPiA+IHNiX2dldGJsayhpbm9k
ZS0+aV9zYiwgcGFyZW50KSByZXR1cm4gYSBudWxsIHB0ciBhbmQgdGFraW5nIGxvY2sgb24KPiA+
IHRoYXQgbGVhZHMgdG8gdGhlIG51bGwtcHRyLWRlcmVmIGJ1Zy4KPiA+Cj4gPiBSZXBvcnRlZC1i
eTogc3l6Ym90K2FhZDU4MTUwY2JjNjRiYTQxYmRjQHN5emthbGxlci5hcHBzcG90bWFpbC5jb20K
PiA+IENsb3NlczogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2V4dGlkPWFhZDU4
MTUwY2JjNjRiYTQxYmRjCj4gPiBTaWduZWQtb2ZmLWJ5OiBQcmluY2UgS3VtYXIgTWF1cnlhIDxw
cmluY2VrdW1hcm1hdXJ5YTA2QGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gQ2hhbmdlIHNpbmNlIHYy
OiBVcGRhdGVkIHN1YmplY3QgYW5kIGFkZGVkIFJlcG9ydGVkLWJ5IGFuZCBjbG9zZXMgdGFncy4K
PiA+Cj4gPiAgZnMvc3lzdi9pdHJlZS5jIHwgMiArKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvc3lzdi9pdHJlZS5jIGIvZnMvc3lz
di9pdHJlZS5jCj4gPiBpbmRleCBiMjI3NjRmZTY2OWMuLjNhNmI2NmU3MTlmZCAxMDA2NDQKPiA+
IC0tLSBhL2ZzL3N5c3YvaXRyZWUuYwo+ID4gKysrIGIvZnMvc3lzdi9pdHJlZS5jCj4gPiBAQCAt
MTQ1LDYgKzE0NSw4IEBAIHN0YXRpYyBpbnQgYWxsb2NfYnJhbmNoKHN0cnVjdCBpbm9kZSAqaW5v
ZGUsCj4gPiAgICAgICAgICAgICAgICAqLwo+ID4gICAgICAgICAgICAgICBwYXJlbnQgPSBibG9j
a190b19jcHUoU1lTVl9TQihpbm9kZS0+aV9zYiksIGJyYW5jaFtuLTFdLmtleSk7Cj4gPiAgICAg
ICAgICAgICAgIGJoID0gc2JfZ2V0YmxrKGlub2RlLT5pX3NiLCBwYXJlbnQpOwo+ID4gKyAgICAg
ICAgICAgICBpZiAoIWJoKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+Cj4gV2hl
biB5b3UgYnJlYWsgaGVyZSB5b3UnbGwgaGl0Ogo+Cj4gLyogQWxsb2NhdGlvbiBmYWlsZWQsIGZy
ZWUgd2hhdCB3ZSBhbHJlYWR5IGFsbG9jYXRlZCAqLwo+IGZvciAoaSA9IDE7IGkgPCBuOyBpKysp
Cj4gICAgICAgICBiZm9yZ2V0KGJyYW5jaFtpXS5iaCk7Cj4gZm9yIChpID0gMDsgaSA8IG47IGkr
KykKPiAgICAgICAgIHN5c3ZfZnJlZV9ibG9jayhpbm9kZS0+aV9zYiwgYnJhbmNoW2ldLmtleSk7
Cj4KPiBiZWxvdy4gVGhlIGNsZWFudXAgcGF0aHMgd2VyZSBjb2RlZCBpbiB0aGUgYXNzdW1wdGlv
biB0aGF0IHNiX2dldGJsaygpCj4gY2FuJ3QgZmFpbC4gU28gYmZvcmdldCgpIGNhbiBhc3N1bWUg
dGhhdCBicmFuY2hbaV0uYmggaGFzIGJlZW4gYWxsb2NhdGVkCj4gYW5kIHNldCB1cC4gU28gdGhh
dCBiZm9yZ2V0KGJyYW5jaFtpXS5iaCkgaXMgeW91ciBuZXh0IHBlbmRpbmcgTlVMTAo+IGRlcmVm
IGFmYWljdC4KCgpJIGRvdWJ0IHRoYXQgd291bGQgaGFwcGVuLiBUaGVyZSBpcyBhIGJyZWFrIGFi
b3ZlIGFzIHdlbGwsIGJlZm9yZSB3ZSBkbwpzYl9nZXRibGsoKS4KCi8qIEFsbG9jYXRlIHRoZSBu
ZXh0IGJsb2NrICovCmJyYW5jaFtuXS5rZXkgPSBzeXN2X25ld19ibG9jayhpbm9kZS0+aV9zYik7
CmlmICghYnJhbmNoW25dLmtleSkKICAgYnJlYWs7CgpUaGUgY2xlYW4gdXAgY29kZSBwYXRoIHJ1
bnMgdGlsbCBpIGlzIGxlc3MgdGhhbiBuIG5vdCBlcXVhbCB0byBuIHdoaWNoCndvdWxkIGhhdmUg
Y2F1c2VkIHRoZSBwcm9ibGVtLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVs
LW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
