Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78852C3DA6F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Aug 2023 21:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED12881771;
	Thu, 24 Aug 2023 21:13:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED12881771
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=QNgbU/UK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b-8vELBMp3Rz; Thu, 24 Aug 2023 21:13:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AF03581418;
	Thu, 24 Aug 2023 21:13:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF03581418
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8907FC0071;
	Thu, 24 Aug 2023 21:13:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2CA4CC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 21:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06BA860F7D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 21:13:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06BA860F7D
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=QNgbU/UK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gxkpq4yStKF0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 21:13:41 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7D6460F2E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 21:13:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7D6460F2E
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-401187f8071so2324365e9.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 14:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692911620; x=1693516420;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EgSSTPGOahDUdKUCKHMcDGGgo1CRIF6AOb3J+pq5kDs=;
 b=QNgbU/UKMHOiYsiKZjwMcnwGu7KhDoVvtPNa+stmp7QROfXmCGnrCmGh7YeTQEt7os
 5ApUTPjfvUdHNRK7GPJMlavDqDucPnb0yJgz1r1p5tAgIJK0H0mRxOTGOaruIFGW8QFK
 6dzWOgen2Y5isRKjO4Ni0GHB8Q9giKiZwGFL1Q41Zpqv5WYOMg8uJzgM1jhFPuLDhNE9
 C/GyLDQRrz9KcnAbONNRSQiLYp2DM9gGvFKq9Vlka/fSVWt2nez+kpmbC0WelViYU9Oj
 9btWhgSJ2BMQhQKlo2oUrPS6VGUPzvSbHjYRNgeP1PQHMX/1gwB33ZcHZ7fHs46ti1X9
 mohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692911620; x=1693516420;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EgSSTPGOahDUdKUCKHMcDGGgo1CRIF6AOb3J+pq5kDs=;
 b=jVgsrBB9LAmDj6O9Hoqdh4EBkYwEC0F14zdKxA9b671T8dFgvPpXxAtQxaII7Rch1T
 aENRtwZwp2+8Qc7rhpuIn9fzLG5fucTVbXDY5CM9R5UqbZQVdJFRxJ+YYzcVpFcuEJw8
 PntVezP/7wo4PkEq2fIDAdLl1WTCvZc5RNxCAJUWD22Fq3U1sPn717hCI/3nHVdcJ7QG
 vQ/NfKiMleDsHkbth4csv6jijSZHm2YF6IddwRBllGkaxork/goRt+vrGN44mni50UlS
 LiwCkWDI03tQpY6ZU6X/BpM9Ah6CqKFAZUQ7Wlqyc1fJWHQqpXS0DQcbgoNgf+LVXdUj
 sPxQ==
X-Gm-Message-State: AOJu0YzNZJxbT4Ew85/sE54C6NhsAnPkNvLt7WS8dqAWC1PlSqwtauGo
 s4ExL+wSmCfngwSQUYQBkUk=
X-Google-Smtp-Source: AGHT+IFxNNn45+YXuwHokxbJuJNMfGh4lON/L0d9aSX+d2S6/cBdxzFYK9H7liLE32C6hAqKxNLFMw==
X-Received: by 2002:a05:600c:3582:b0:401:b24b:8279 with SMTP id
 p2-20020a05600c358200b00401b24b8279mr1232646wmq.1.1692911619419; 
 Thu, 24 Aug 2023 14:13:39 -0700 (PDT)
Received: from mmaatuq-HP-Laptop-15-dy2xxx
 ([2001:8f8:1163:806e:f960:7197:6afd:b6ed])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a1c720f000000b003fed630f560sm413257wmc.36.2023.08.24.14.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 14:13:38 -0700 (PDT)
Date: Fri, 25 Aug 2023 01:13:32 +0400
From: Mahmoud Matook <mahmoudmatook.mm@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Subject: Re: [PATCH v2 2/2] selftests/net: replace ternary operator with
 min()/max()
Message-ID: <20230824211332.bnyvxda7a2ws75ep@mmaatuq-HP-Laptop-15-dy2xxx>
Mail-Followup-To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 keescook@chromium.org, edumazet@google.com, wad@chromium.org,
 luto@amacapital.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kuba@kernel.org, shuah@kernel.org,
 pabeni@redhat.com, linux-kselftest@vger.kernel.org,
 davem@davemloft.net, linux-kernel-mentees@lists.linuxfoundation.org
References: <20230824202415.131824-1-mahmoudmatook.mm@gmail.com>
 <20230824202415.131824-2-mahmoudmatook.mm@gmail.com>
 <CAF=yD-+8GBB75ddvG1MECYrYpwbxH1RMcre6EYiqXo4pk_Nx5g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF=yD-+8GBB75ddvG1MECYrYpwbxH1RMcre6EYiqXo4pk_Nx5g@mail.gmail.com>
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

T24gMDgvMjQsIFdpbGxlbSBkZSBCcnVpam4gd3JvdGU6Cgo+IE9uIFRodSwgQXVnIDI0LCAyMDIz
IGF0IDQ6MjXigK9QTSBNYWhtb3VkIE1hYXR1cQo+IDxtYWhtb3VkbWF0b29rLm1tQGdtYWlsLmNv
bT4gd3JvdGU6Cj4gPgo+ID4gRml4IHRoZSBmb2xsb3dpbmcgY29jY2ljaGVjayB3YXJuaW5nOgo+
ID4gdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L3VkcGdzb19iZW5jaF90eC5jOjI5NzoxOC0x
OTogV0FSTklORyBvcHBvcnR1bml0eSBmb3IgbWluKCkKPiA+IHRvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL25ldC91ZHBnc29fYmVuY2hfdHguYzozNTQ6MjctMjg6IFdBUk5JTkcgb3Bwb3J0dW5pdHkg
Zm9yIG1pbigpCj4gPiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvc29fdHh0aW1lLmM6MTI5
OjI0LTI2OiBXQVJOSU5HIG9wcG9ydHVuaXR5IGZvciBtYXgoKQo+ID4gdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvbmV0L3NvX3R4dGltZS5jOjk2OjMwLTMxOiBXQVJOSU5HIG9wcG9ydHVuaXR5IGZv
ciBtYXgoKQo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE1haG1vdWQgTWFhdHVxIDxtYWhtb3VkbWF0
b29rLm1tQGdtYWlsLmNvbT4KPiA+IFN1Z2dlc3RlZC1ieTogV2lsbGVtIGRlIEJydWlqbiA8d2ls
bGVtZGVicnVpam4ua2VybmVsQGdtYWlsLmNvbT4KPiAKPiBJIGRpZCBub3Qgc3VnZ2VzdCB0aGlz
IGNoYW5nZS4KPiAKdGhlIHN1Z2dlc3Rpb24gaSBtZWFudCBoZXJlIGlzIGFib3V0IHRoZSBmb2xs
b3dpbmcgcGFydAoiTm90ZSB0aGF0IGEgbW9yZSBzdHJpY3QgdmVyc2lvbiB0aGF0IGluY2x1ZGVz
IF9fdHlwZWNoZWNrIHdvdWxkCndhcm4gb24gdGhlIHR5cGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRv
dGFsX2xlbiBhbmQgY2ZnX21zcy4gRmluZQp3aXRoIGNoYW5naW5nIHRoZSB0eXBlIG9mIGNmZ19t
c3MgaW4gdGhlIGZvbGxvdy1vbiBwYXRjaCB0byBhZGRyZXNzCnRoYXQuIgphcyBtZW50aW9uZWQg
aGVyZSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvQ0FGPXlELSs2Y1dUaURncHN1PWhVVitP
dnpERlJhVDJaVW10UW85cVRyQ0I5aS0rN25nQG1haWwuZ21haWwuY29tLwpJIHRyaWVkIHRvIGNo
YW5nZSB0aGUgdHlwZSBvZiBjZmdfbXNzIGJ1dCBpdCBjcmVhdGVzIGEgZGlmZmVyZW50IHdhcm4K
YXQgdWRwZ3NvX2JlbmNoX3R4LmM6MzU0IGJldHdlZW4gY2ZnX21zcyBhbmQgbGVmdCB0aGF0J3Mg
d2F5IGkgY2FzdGVkCmluc3RlYWQuCmFwb2xvZ3kgaWYgaSBtaXN1bmRlcnN0b29kIHlvdXIgcG9p
bnQuCj4gPiAtLS0KPiA+IGNoYW5nZXMgaW4gdjI6Cj4gPiBjYXN0IHZhciBjZmdfbXNzIHRvIGlu
dCB0byBhdm9pZCBzdGF0aWMgYXNzZXJ0aW9uCj4gPiBhZnRlciBwcm92aWRpbmcgYSBzdHJpY3Rl
ciB2ZXJzaW9uIG9mIG1pbigpIHRoYXQgZG9lcyBzaWduZWRuZXNzIGNoZWNraW5nLgo+ID4gLS0t
Cj4gPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L01ha2VmaWxlICAgICAgICAgIHwgMiAr
Kwo+ID4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9zb190eHRpbWUuYyAgICAgICB8IDcg
KysrKy0tLQo+ID4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC91ZHBnc29fYmVuY2hfdHgu
YyB8IDYgKysrLS0tCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDYgZGVs
ZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25l
dC9NYWtlZmlsZSBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9NYWtlZmlsZQo+ID4gaW5k
ZXggN2YzYWIyYTkzZWQ2Li5hMDZjYzI1NDg5ZjkgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9uZXQvTWFrZWZpbGUKPiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL25ldC9NYWtlZmlsZQo+ID4gQEAgLTMsNiArMyw4IEBACj4gPgo+ID4gIENGTEFHUyA9ICAt
V2FsbCAtV2wsLS1uby1hcy1uZWVkZWQgLU8yIC1nCj4gPiAgQ0ZMQUdTICs9IC1JLi4vLi4vLi4v
Li4vdXNyL2luY2x1ZGUvICQoS0hEUl9JTkNMVURFUykKPiA+ICsjIEFkZGl0aW9uYWwgaW5jbHVk
ZSBwYXRocyBuZWVkZWQgYnkga3NlbGZ0ZXN0LmgKPiA+ICtDRkxBR1MgKz0gLUkuLi8KPiAKPiBX
aHkgZG9lcyBrc2VsZnRlc3QuaCBuZWVkIHRoaXM/IEl0IGRvZXMgbm90IGluY2x1ZGUgYW55dGhp
bmcgZWxzZT8KPiAKPiBJJ2QganVzdCBhZGQgI2luY2x1ZGUgIi4uL2tzZWxmdGVzdHMuaCIgdG8g
c29fdHh0aW1lLmMgYW5kIHJlbW92ZSB0aGUKPiBwYXRoIGNoYW5nZSBmcm9tIHVkcGdzb19iZW5j
aF90eC5jCj4gCj4gRmluZSB3aXRoIHRoaXMgYXBwcm9hY2guIEp1c3QgZG9uJ3QgdW5kZXJzdGFu
ZCB0aGUgY29tbWVudAo+Cgp0aGUgY29tbWVudCBoZXJlIGlzIHdyb25nIGFuZCBpdCBzaG91bGQg
YmUgY2hhbmdlZCB0byBpbmNsdWRlIHBhdGgKbmVlZGVkIHRvIGluY2x1ZGUga3NlbGZ0ZXN0Lmgg
b3IgdG8gYmUgZGVsZXRlZAoKPiA+Cj4gPiAgVEVTVF9QUk9HUyA6PSBydW5fbmV0c29ja3Rlc3Rz
IHJ1bl9hZnBhY2tldHRlc3RzIHRlc3RfYnBmLnNoIG5ldGRldmljZS5zaCBcCj4gPiAgICAgICAg
ICAgICAgIHJ0bmV0bGluay5zaCB4ZnJtX3BvbGljeS5zaCB0ZXN0X2JsYWNraG9sZV9kZXYuc2gK
PiA+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvc29fdHh0aW1lLmMg
Yi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvc29fdHh0aW1lLmMKPiA+IGluZGV4IDI2NzJh
YzBiNmQxZi4uMjkzNjE3NGU3ZGU0IDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvbmV0L3NvX3R4dGltZS5jCj4gPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9u
ZXQvc29fdHh0aW1lLmMKPiA+IEBAIC0zMyw2ICszMyw4IEBACj4gPiAgI2luY2x1ZGUgPHVuaXN0
ZC5oPgo+ID4gICNpbmNsdWRlIDxwb2xsLmg+Cj4gPgo+ID4gKyNpbmNsdWRlICJrc2VsZnRlc3Qu
aCIKPiA+ICsKPiA+ICBzdGF0aWMgaW50ICAgICBjZmdfY2xvY2tpZCAgICAgPSBDTE9DS19UQUk7
Cj4gPiAgc3RhdGljIHVpbnQxNl90ICAgICAgICBjZmdfcG9ydCAgICAgICAgPSA4MDAwOwo+ID4g
IHN0YXRpYyBpbnQgICAgIGNmZ192YXJpYW5jZV91cyA9IDQwMDA7Cj4gPiBAQCAtOTMsOCArOTUs
NyBAQCBzdGF0aWMgdm9pZCBkb19zZW5kX29uZShpbnQgZmR0LCBzdHJ1Y3QgdGltZWRfc2VuZCAq
dHMpCj4gPiAgICAgICAgICAgICAgICAgbXNnLm1zZ19jb250cm9sbGVuID0gc2l6ZW9mKGNvbnRy
b2wpOwo+ID4KPiA+ICAgICAgICAgICAgICAgICB0ZGVsaXZlciA9IGdsb2JfdHN0YXJ0ICsgdHMt
PmRlbGF5X3VzICogMTAwMDsKPiA+IC0gICAgICAgICAgICAgICB0ZGVsaXZlcl9tYXggPSB0ZGVs
aXZlcl9tYXggPiB0ZGVsaXZlciA/Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dGRlbGl2ZXJfbWF4IDogdGRlbGl2ZXI7Cj4gPiArICAgICAgICAgICAgICAgdGRlbGl2ZXJfbWF4
ID0gbWF4KHRkZWxpdmVyX21heCwgdGRlbGl2ZXIpOwo+ID4KPiA+ICAgICAgICAgICAgICAgICBj
bSA9IENNU0dfRklSU1RIRFIoJm1zZyk7Cj4gPiAgICAgICAgICAgICAgICAgY20tPmNtc2dfbGV2
ZWwgPSBTT0xfU09DS0VUOwo+ID4gQEAgLTEyNiw3ICsxMjcsNyBAQCBzdGF0aWMgdm9pZCBkb19y
ZWN2X29uZShpbnQgZmRyLCBzdHJ1Y3QgdGltZWRfc2VuZCAqdHMpCj4gPiAgICAgICAgICAgICAg
ICAgZXJyb3IoMSwgMCwgInJlYWQ6ICVkQiIsIHJldCk7Cj4gPgo+ID4gICAgICAgICB0c3RvcCA9
IChnZXR0aW1lX25zKGNmZ19jbG9ja2lkKSAtIGdsb2JfdHN0YXJ0KSAvIDEwMDA7Cj4gPiAtICAg
ICAgIHRleHBlY3QgPSB0cy0+ZGVsYXlfdXMgPj0gMCA/IHRzLT5kZWxheV91cyA6IDA7Cj4gPiAr
ICAgICAgIHRleHBlY3QgPSBtYXgodHMtPmRlbGF5X3VzLCAwKTsKPiA+Cj4gPiAgICAgICAgIGZw
cmludGYoc3RkZXJyLCAicGF5bG9hZDolYyBkZWxheTolbGxkIGV4cGVjdGVkOiVsbGQgKHVzKVxu
IiwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJidWZbMF0sIChsb25nIGxvbmcpdHN0b3As
IChsb25nIGxvbmcpdGV4cGVjdCk7Cj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvbmV0L3VkcGdzb19iZW5jaF90eC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0
L3VkcGdzb19iZW5jaF90eC5jCj4gPiBpbmRleCA0NzczOTI3MTVhOWEuLjZiZDMyYTMxMjkwMSAx
MDA2NDQKPiA+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC91ZHBnc29fYmVuY2hf
dHguYwo+ID4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L3VkcGdzb19iZW5jaF90
eC5jCj4gPiBAQCAtMjUsNyArMjUsNyBAQAo+ID4gICNpbmNsdWRlIDxzeXMvdHlwZXMuaD4KPiA+
ICAjaW5jbHVkZSA8dW5pc3RkLmg+Cj4gPgo+ID4gLSNpbmNsdWRlICIuLi9rc2VsZnRlc3QuaCIK
PiA+ICsjaW5jbHVkZSAia3NlbGZ0ZXN0LmgiCj4gPgo+ID4gICNpZm5kZWYgRVRIX01BWF9NVFUK
PiA+ICAjZGVmaW5lIEVUSF9NQVhfTVRVIDB4RkZGRlUKPiA+IEBAIC0yOTQsNyArMjk0LDcgQEAg
c3RhdGljIGludCBzZW5kX3VkcChpbnQgZmQsIGNoYXIgKmRhdGEpCj4gPiAgICAgICAgIHRvdGFs
X2xlbiA9IGNmZ19wYXlsb2FkX2xlbjsKPiA+Cj4gPiAgICAgICAgIHdoaWxlICh0b3RhbF9sZW4p
IHsKPiA+IC0gICAgICAgICAgICAgICBsZW4gPSB0b3RhbF9sZW4gPCBjZmdfbXNzID8gdG90YWxf
bGVuIDogY2ZnX21zczsKPiA+ICsgICAgICAgICAgICAgICBsZW4gPSBtaW4odG90YWxfbGVuLCAo
aW50KWNmZ19tc3MpOwo+ID4KPiA+ICAgICAgICAgICAgICAgICByZXQgPSBzZW5kdG8oZmQsIGRh
dGEsIGxlbiwgY2ZnX3plcm9jb3B5ID8gTVNHX1pFUk9DT1BZIDogMCwKPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY2ZnX2Nvbm5lY3RlZCA/IE5VTEwgOiAodm9pZCAqKSZjZmdfZHN0
X2FkZHIsCj4gPiBAQCAtMzUxLDcgKzM1MSw3IEBAIHN0YXRpYyBpbnQgc2VuZF91ZHBfc2VuZG1t
c2coaW50IGZkLCBjaGFyICpkYXRhKQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgZXJyb3Io
MSwgMCwgInNlbmRtbXNnOiBleGNlZWRzIG1heF9ucl9tc2ciKTsKPiA+Cj4gPiAgICAgICAgICAg
ICAgICAgaW92W2ldLmlvdl9iYXNlID0gZGF0YSArIG9mZjsKPiA+IC0gICAgICAgICAgICAgICBp
b3ZbaV0uaW92X2xlbiA9IGNmZ19tc3MgPCBsZWZ0ID8gY2ZnX21zcyA6IGxlZnQ7Cj4gPiArICAg
ICAgICAgICAgICAgaW92W2ldLmlvdl9sZW4gPSBtaW4oY2ZnX21zcywgbGVmdCk7Cj4gPgo+ID4g
ICAgICAgICAgICAgICAgIG1tc2dzW2ldLm1zZ19oZHIubXNnX2lvdiA9IGlvdiArIGk7Cj4gPiAg
ICAgICAgICAgICAgICAgbW1zZ3NbaV0ubXNnX2hkci5tc2dfaW92bGVuID0gMTsKPiA+IC0tCj4g
PiAyLjM0LjEKPiA+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVl
c0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9u
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
