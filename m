Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEFDC3DA6F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Aug 2023 20:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30D0A605D8;
	Thu, 24 Aug 2023 20:33:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30D0A605D8
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=oucv5HGE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IzYOoDQXn9tt; Thu, 24 Aug 2023 20:33:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1A24B60597;
	Thu, 24 Aug 2023 20:33:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A24B60597
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9CF5C0071;
	Thu, 24 Aug 2023 20:33:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37D09C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 20:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB12C60F69
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 20:33:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB12C60F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZSb-9WR2kJFA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 20:33:21 +0000 (UTC)
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D734B60F5E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 20:33:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D734B60F5E
Received: by mail-vs1-xe2c.google.com with SMTP id
 ada2fe7eead31-44d3666c6cfso105235137.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 13:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692909199; x=1693513999;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3aYYmy3awho6rAhUljjdS40H8hflSwFb0/PHFAG3tf4=;
 b=oucv5HGEu6xUpa0pKiUgtB02O+JRlIqPJoQkJYUvjfw1+9hsEiNIkfs/2lIXRHtDS0
 f9uy2ZpvrShCT72tW/ASl8UooDCnUtWBD8xHpP/cvtOUc3Au45IXcy5lvJZi2t+ropAK
 3KVBc+NmlhkIzCeKN2XGgyle9c0xCLP1B1wdlWKMjFO80/BL4l171VAVSgFMqfCBl+O/
 vibWgIzFxFTjBv7YkBppqvnbsj2rLx58NGPwJ0WSCeZwgeZrY2ZkKBKENlTOewPfxCB6
 5yTv9IlIOHZhwMWMNNF1aAdJ+75+2whUhpNvyhhqatWxW64YLFrD1QP7al03Jn6Dp6zY
 ZfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692909199; x=1693513999;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3aYYmy3awho6rAhUljjdS40H8hflSwFb0/PHFAG3tf4=;
 b=ZklO7PKIzh6nbLpno7S0JkDab8MUnTu1a0HsK/GjGpkDPOdJkGZWyIkxnTUu8xFnd6
 D8H/uPtDAosGLiAKQ+LHpa+AORter1uFgs5XqzfOVBhO/4nnCEFpnZ2WXpm9k/kA2NAu
 NnLhCRegCoOUJLadVv8SBu0isl0RbX7scO17lEiz5/UY/v5S5x7uVvzo9STziw7Yi98r
 KfPYaaxfST6VGh7bIg28ixa1ggGPITWfcDtuD5v8D/PP5nLrLNU5/ET3fzy5TZi5C3Ck
 whXXYpkl0pGRdo7Zirn0qErpJlobZPvvUFOTAVlE0hPurkchvDbMpR0uZIhADmIYDIew
 4CHw==
X-Gm-Message-State: AOJu0YyWfCiNpWm0+DxjRdMwkrkbi0d+ziLGQNSR3RYIIIvBR/7wmGO4
 wULEF1+kcRdCuw0WUhpZBwflzQBAVmz4W83D07c=
X-Google-Smtp-Source: AGHT+IHHLuj1KUNlztQEEMp3IBzs7Iur9+fVFjFsD0XRIAwZvjsi4KnOmyqUYb3ChpHd5Fa4aF1JxjRTAtlASJe5IWE=
X-Received: by 2002:a67:ce15:0:b0:44e:a18a:2514 with SMTP id
 s21-20020a67ce15000000b0044ea18a2514mr1650062vsl.33.1692909199547; Thu, 24
 Aug 2023 13:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230824202415.131824-1-mahmoudmatook.mm@gmail.com>
 <20230824202415.131824-2-mahmoudmatook.mm@gmail.com>
In-Reply-To: <20230824202415.131824-2-mahmoudmatook.mm@gmail.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Thu, 24 Aug 2023 16:32:43 -0400
Message-ID: <CAF=yD-+8GBB75ddvG1MECYrYpwbxH1RMcre6EYiqXo4pk_Nx5g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] selftests/net: replace ternary operator with
 min()/max()
To: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
Cc: wad@chromium.org, keescook@chromium.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, luto@amacapital.net, edumazet@google.com,
 linux-kselftest@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com,
 shuah@kernel.org, davem@davemloft.net,
 linux-kernel-mentees@lists.linuxfoundation.org
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

T24gVGh1LCBBdWcgMjQsIDIwMjMgYXQgNDoyNeKAr1BNIE1haG1vdWQgTWFhdHVxCjxtYWhtb3Vk
bWF0b29rLm1tQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBGaXggdGhlIGZvbGxvd2luZyBjb2NjaWNo
ZWNrIHdhcm5pbmc6Cj4gdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L3VkcGdzb19iZW5jaF90
eC5jOjI5NzoxOC0xOTogV0FSTklORyBvcHBvcnR1bml0eSBmb3IgbWluKCkKPiB0b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9uZXQvdWRwZ3NvX2JlbmNoX3R4LmM6MzU0OjI3LTI4OiBXQVJOSU5HIG9w
cG9ydHVuaXR5IGZvciBtaW4oKQo+IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9zb190eHRp
bWUuYzoxMjk6MjQtMjY6IFdBUk5JTkcgb3Bwb3J0dW5pdHkgZm9yIG1heCgpCj4gdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMvbmV0L3NvX3R4dGltZS5jOjk2OjMwLTMxOiBXQVJOSU5HIG9wcG9ydHVu
aXR5IGZvciBtYXgoKQo+Cj4gU2lnbmVkLW9mZi1ieTogTWFobW91ZCBNYWF0dXEgPG1haG1vdWRt
YXRvb2subW1AZ21haWwuY29tPgo+IFN1Z2dlc3RlZC1ieTogV2lsbGVtIGRlIEJydWlqbiA8d2ls
bGVtZGVicnVpam4ua2VybmVsQGdtYWlsLmNvbT4KCkkgZGlkIG5vdCBzdWdnZXN0IHRoaXMgY2hh
bmdlLgoKPiAtLS0KPiBjaGFuZ2VzIGluIHYyOgo+IGNhc3QgdmFyIGNmZ19tc3MgdG8gaW50IHRv
IGF2b2lkIHN0YXRpYyBhc3NlcnRpb24KPiBhZnRlciBwcm92aWRpbmcgYSBzdHJpY3RlciB2ZXJz
aW9uIG9mIG1pbigpIHRoYXQgZG9lcyBzaWduZWRuZXNzIGNoZWNraW5nLgo+IC0tLQo+ICB0b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvTWFrZWZpbGUgICAgICAgICAgfCAyICsrCj4gIHRvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9zb190eHRpbWUuYyAgICAgICB8IDcgKysrKy0tLQo+ICB0
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvdWRwZ3NvX2JlbmNoX3R4LmMgfCA2ICsrKy0tLQo+
ICAzIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvTWFrZWZpbGUgYi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvTWFrZWZpbGUKPiBpbmRleCA3ZjNhYjJhOTNlZDYuLmEwNmNj
MjU0ODlmOSAxMDA2NDQKPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvTWFrZWZp
bGUKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvTWFrZWZpbGUKPiBAQCAtMyw2
ICszLDggQEAKPgo+ICBDRkxBR1MgPSAgLVdhbGwgLVdsLC0tbm8tYXMtbmVlZGVkIC1PMiAtZwo+
ICBDRkxBR1MgKz0gLUkuLi8uLi8uLi8uLi91c3IvaW5jbHVkZS8gJChLSERSX0lOQ0xVREVTKQo+
ICsjIEFkZGl0aW9uYWwgaW5jbHVkZSBwYXRocyBuZWVkZWQgYnkga3NlbGZ0ZXN0LmgKPiArQ0ZM
QUdTICs9IC1JLi4vCgpXaHkgZG9lcyBrc2VsZnRlc3QuaCBuZWVkIHRoaXM/IEl0IGRvZXMgbm90
IGluY2x1ZGUgYW55dGhpbmcgZWxzZT8KCkknZCBqdXN0IGFkZCAjaW5jbHVkZSAiLi4va3NlbGZ0
ZXN0cy5oIiB0byBzb190eHRpbWUuYyBhbmQgcmVtb3ZlIHRoZQpwYXRoIGNoYW5nZSBmcm9tIHVk
cGdzb19iZW5jaF90eC5jCgpGaW5lIHdpdGggdGhpcyBhcHByb2FjaC4gSnVzdCBkb24ndCB1bmRl
cnN0YW5kIHRoZSBjb21tZW50Cgo+Cj4gIFRFU1RfUFJPR1MgOj0gcnVuX25ldHNvY2t0ZXN0cyBy
dW5fYWZwYWNrZXR0ZXN0cyB0ZXN0X2JwZi5zaCBuZXRkZXZpY2Uuc2ggXAo+ICAgICAgICAgICAg
ICAgcnRuZXRsaW5rLnNoIHhmcm1fcG9saWN5LnNoIHRlc3RfYmxhY2tob2xlX2Rldi5zaAo+IGRp
ZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvc29fdHh0aW1lLmMgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvc29fdHh0aW1lLmMKPiBpbmRleCAyNjcyYWMwYjZkMWYu
LjI5MzYxNzRlN2RlNCAxMDA2NDQKPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQv
c29fdHh0aW1lLmMKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvc29fdHh0aW1l
LmMKPiBAQCAtMzMsNiArMzMsOCBAQAo+ICAjaW5jbHVkZSA8dW5pc3RkLmg+Cj4gICNpbmNsdWRl
IDxwb2xsLmg+Cj4KPiArI2luY2x1ZGUgImtzZWxmdGVzdC5oIgo+ICsKPiAgc3RhdGljIGludCAg
ICAgY2ZnX2Nsb2NraWQgICAgID0gQ0xPQ0tfVEFJOwo+ICBzdGF0aWMgdWludDE2X3QgICAgICAg
IGNmZ19wb3J0ICAgICAgICA9IDgwMDA7Cj4gIHN0YXRpYyBpbnQgICAgIGNmZ192YXJpYW5jZV91
cyA9IDQwMDA7Cj4gQEAgLTkzLDggKzk1LDcgQEAgc3RhdGljIHZvaWQgZG9fc2VuZF9vbmUoaW50
IGZkdCwgc3RydWN0IHRpbWVkX3NlbmQgKnRzKQo+ICAgICAgICAgICAgICAgICBtc2cubXNnX2Nv
bnRyb2xsZW4gPSBzaXplb2YoY29udHJvbCk7Cj4KPiAgICAgICAgICAgICAgICAgdGRlbGl2ZXIg
PSBnbG9iX3RzdGFydCArIHRzLT5kZWxheV91cyAqIDEwMDA7Cj4gLSAgICAgICAgICAgICAgIHRk
ZWxpdmVyX21heCA9IHRkZWxpdmVyX21heCA+IHRkZWxpdmVyID8KPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdGRlbGl2ZXJfbWF4IDogdGRlbGl2ZXI7Cj4gKyAgICAgICAgICAgICAg
IHRkZWxpdmVyX21heCA9IG1heCh0ZGVsaXZlcl9tYXgsIHRkZWxpdmVyKTsKPgo+ICAgICAgICAg
ICAgICAgICBjbSA9IENNU0dfRklSU1RIRFIoJm1zZyk7Cj4gICAgICAgICAgICAgICAgIGNtLT5j
bXNnX2xldmVsID0gU09MX1NPQ0tFVDsKPiBAQCAtMTI2LDcgKzEyNyw3IEBAIHN0YXRpYyB2b2lk
IGRvX3JlY3Zfb25lKGludCBmZHIsIHN0cnVjdCB0aW1lZF9zZW5kICp0cykKPiAgICAgICAgICAg
ICAgICAgZXJyb3IoMSwgMCwgInJlYWQ6ICVkQiIsIHJldCk7Cj4KPiAgICAgICAgIHRzdG9wID0g
KGdldHRpbWVfbnMoY2ZnX2Nsb2NraWQpIC0gZ2xvYl90c3RhcnQpIC8gMTAwMDsKPiAtICAgICAg
IHRleHBlY3QgPSB0cy0+ZGVsYXlfdXMgPj0gMCA/IHRzLT5kZWxheV91cyA6IDA7Cj4gKyAgICAg
ICB0ZXhwZWN0ID0gbWF4KHRzLT5kZWxheV91cywgMCk7Cj4KPiAgICAgICAgIGZwcmludGYoc3Rk
ZXJyLCAicGF5bG9hZDolYyBkZWxheTolbGxkIGV4cGVjdGVkOiVsbGQgKHVzKVxuIiwKPiAgICAg
ICAgICAgICAgICAgICAgICAgICByYnVmWzBdLCAobG9uZyBsb25nKXRzdG9wLCAobG9uZyBsb25n
KXRleHBlY3QpOwo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvdWRw
Z3NvX2JlbmNoX3R4LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvdWRwZ3NvX2JlbmNo
X3R4LmMKPiBpbmRleCA0NzczOTI3MTVhOWEuLjZiZDMyYTMxMjkwMSAxMDA2NDQKPiAtLS0gYS90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvdWRwZ3NvX2JlbmNoX3R4LmMKPiArKysgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvdWRwZ3NvX2JlbmNoX3R4LmMKPiBAQCAtMjUsNyArMjUs
NyBAQAo+ICAjaW5jbHVkZSA8c3lzL3R5cGVzLmg+Cj4gICNpbmNsdWRlIDx1bmlzdGQuaD4KPgo+
IC0jaW5jbHVkZSAiLi4va3NlbGZ0ZXN0LmgiCj4gKyNpbmNsdWRlICJrc2VsZnRlc3QuaCIKPgo+
ICAjaWZuZGVmIEVUSF9NQVhfTVRVCj4gICNkZWZpbmUgRVRIX01BWF9NVFUgMHhGRkZGVQo+IEBA
IC0yOTQsNyArMjk0LDcgQEAgc3RhdGljIGludCBzZW5kX3VkcChpbnQgZmQsIGNoYXIgKmRhdGEp
Cj4gICAgICAgICB0b3RhbF9sZW4gPSBjZmdfcGF5bG9hZF9sZW47Cj4KPiAgICAgICAgIHdoaWxl
ICh0b3RhbF9sZW4pIHsKPiAtICAgICAgICAgICAgICAgbGVuID0gdG90YWxfbGVuIDwgY2ZnX21z
cyA/IHRvdGFsX2xlbiA6IGNmZ19tc3M7Cj4gKyAgICAgICAgICAgICAgIGxlbiA9IG1pbih0b3Rh
bF9sZW4sIChpbnQpY2ZnX21zcyk7Cj4KPiAgICAgICAgICAgICAgICAgcmV0ID0gc2VuZHRvKGZk
LCBkYXRhLCBsZW4sIGNmZ196ZXJvY29weSA/IE1TR19aRVJPQ09QWSA6IDAsCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjZmdfY29ubmVjdGVkID8gTlVMTCA6ICh2b2lkICopJmNmZ19k
c3RfYWRkciwKPiBAQCAtMzUxLDcgKzM1MSw3IEBAIHN0YXRpYyBpbnQgc2VuZF91ZHBfc2VuZG1t
c2coaW50IGZkLCBjaGFyICpkYXRhKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGVycm9yKDEs
IDAsICJzZW5kbW1zZzogZXhjZWVkcyBtYXhfbnJfbXNnIik7Cj4KPiAgICAgICAgICAgICAgICAg
aW92W2ldLmlvdl9iYXNlID0gZGF0YSArIG9mZjsKPiAtICAgICAgICAgICAgICAgaW92W2ldLmlv
dl9sZW4gPSBjZmdfbXNzIDwgbGVmdCA/IGNmZ19tc3MgOiBsZWZ0Owo+ICsgICAgICAgICAgICAg
ICBpb3ZbaV0uaW92X2xlbiA9IG1pbihjZmdfbXNzLCBsZWZ0KTsKPgo+ICAgICAgICAgICAgICAg
ICBtbXNnc1tpXS5tc2dfaGRyLm1zZ19pb3YgPSBpb3YgKyBpOwo+ICAgICAgICAgICAgICAgICBt
bXNnc1tpXS5tc2dfaGRyLm1zZ19pb3ZsZW4gPSAxOwo+IC0tCj4gMi4zNC4xCj4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRl
ZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgta2VybmVsLW1lbnRlZXMK
