Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C88C3DA6F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Aug 2023 21:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 481C960FC7;
	Thu, 24 Aug 2023 21:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 481C960FC7
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=W3U/+wyH
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9FdEqHpVfx-G; Thu, 24 Aug 2023 21:22:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CE91560FAF;
	Thu, 24 Aug 2023 21:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE91560FAF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3ECFC0039;
	Thu, 24 Aug 2023 21:22:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 509B0C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 21:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24AFC835F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 21:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24AFC835F2
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=W3U/+wyH
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6rpFLu7kRfaF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 21:22:39 +0000 (UTC)
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03BD9835E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 21:22:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03BD9835E9
Received: by mail-vs1-xe29.google.com with SMTP id
 ada2fe7eead31-44e8f9f3cceso128958137.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 14:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692912158; x=1693516958;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AZvcG589l1AbddG8/t0ALjJZ+ZBC/3SPsKCiVH6+/H4=;
 b=W3U/+wyH0NSyqy5A4DWxab172DSS0fWPGnd+061PkzfcfZiHqBRYmoptLeXllY660/
 CLk65bWCPuHFt+V1VyjsxpnJ4+9KpWWYEt3Gh9gtFLL19ORxx4vYwxzlbsrmxrVwzo7n
 bftKaNTh0uolpOiEf5LkhSK/skyQa3A2D57qJh2l7HxtEU48E0jeaCHde8FB+nS/za9Q
 ZS8ZGt49RxHYy7Rf/xjsID0+vs6NIdg3YgRiEDvdL/wkHD8XULAfz6apzGXHX1rkCpGh
 3+e+qcXpocKYuJ09DvRb/SxRyKwA9tuVFOvuBNc3wuRkrgHuxDcbcIGhf05IBPrkhAd3
 n1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692912158; x=1693516958;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AZvcG589l1AbddG8/t0ALjJZ+ZBC/3SPsKCiVH6+/H4=;
 b=CkxIK+bHUuB2OE+d+ShY+o8A/uXO20rhO0DpsqD6mCOlbo74DD34FaJepFX6URnjge
 IFu2oYNZ3C+5FIZSPOyKyaUeFUCAiwBMqssk7/Ybq7jMbfYYbj74ZBaTkvF26AkC+f3c
 viLBefNAzJaiifmuTOH1Jvwp82QrNh7H9TXvwGLzrRcgYmmjLT1VE04k/LnJJQevmr5Q
 Sw19Xs0PSg16iHAhgeJwrb5EPeI339vr1oCUoncTp1myDD9aMnlHkdXso7uS4mW4MMhw
 YGnZRYdDU5p7H6A3ntm8L47JwB5iLNlozJ4vcSIZ0cOHgAqnhvSw3vKWVAgCWbpez/zb
 AGuA==
X-Gm-Message-State: AOJu0YwtWZLLLA+zmpclFGqppWoIBSwtvqzcWNDarFpIZBHdkSN0Ax2J
 fnBJLYSSd30ft0O0DkWRfDgkau9mG5o3mPLmP7g=
X-Google-Smtp-Source: AGHT+IFndlTlMUYFyhuwlLiW1PSdaGai48rzrDmPVINH0uPZwsoPG2zpYKClvZxDe3ulnATQ5l1/8haEcW0cAfST37w=
X-Received: by 2002:a05:6102:448:b0:44e:9168:918e with SMTP id
 e8-20020a056102044800b0044e9168918emr4822386vsq.29.1692912157771; Thu, 24 Aug
 2023 14:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230824202415.131824-1-mahmoudmatook.mm@gmail.com>
 <20230824202415.131824-2-mahmoudmatook.mm@gmail.com>
 <CAF=yD-+8GBB75ddvG1MECYrYpwbxH1RMcre6EYiqXo4pk_Nx5g@mail.gmail.com>
 <20230824211332.bnyvxda7a2ws75ep@mmaatuq-HP-Laptop-15-dy2xxx>
In-Reply-To: <20230824211332.bnyvxda7a2ws75ep@mmaatuq-HP-Laptop-15-dy2xxx>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Thu, 24 Aug 2023 17:22:01 -0400
Message-ID: <CAF=yD-JPL6M9_q_W2OZH=4wis3GSfpYAo5Y7Jp+SyhA+NLeE3g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] selftests/net: replace ternary operator with
 min()/max()
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, keescook@chromium.org, 
 edumazet@google.com, wad@chromium.org, luto@amacapital.net, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org, 
 shuah@kernel.org, pabeni@redhat.com, linux-kselftest@vger.kernel.org, 
 davem@davemloft.net, linux-kernel-mentees@lists.linuxfoundation.org
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

T24gVGh1LCBBdWcgMjQsIDIwMjMgYXQgNToxM+KAr1BNIE1haG1vdWQgTWF0b29rCjxtYWhtb3Vk
bWF0b29rLm1tQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiAwOC8yNCwgV2lsbGVtIGRlIEJydWlq
biB3cm90ZToKPgo+ID4gT24gVGh1LCBBdWcgMjQsIDIwMjMgYXQgNDoyNeKAr1BNIE1haG1vdWQg
TWFhdHVxCj4gPiA8bWFobW91ZG1hdG9vay5tbUBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPgo+ID4g
PiBGaXggdGhlIGZvbGxvd2luZyBjb2NjaWNoZWNrIHdhcm5pbmc6Cj4gPiA+IHRvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL25ldC91ZHBnc29fYmVuY2hfdHguYzoyOTc6MTgtMTk6IFdBUk5JTkcgb3Bw
b3J0dW5pdHkgZm9yIG1pbigpCj4gPiA+IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC91ZHBn
c29fYmVuY2hfdHguYzozNTQ6MjctMjg6IFdBUk5JTkcgb3Bwb3J0dW5pdHkgZm9yIG1pbigpCj4g
PiA+IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9zb190eHRpbWUuYzoxMjk6MjQtMjY6IFdB
Uk5JTkcgb3Bwb3J0dW5pdHkgZm9yIG1heCgpCj4gPiA+IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L25ldC9zb190eHRpbWUuYzo5NjozMC0zMTogV0FSTklORyBvcHBvcnR1bml0eSBmb3IgbWF4KCkK
PiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogTWFobW91ZCBNYWF0dXEgPG1haG1vdWRtYXRvb2su
bW1AZ21haWwuY29tPgo+ID4gPiBTdWdnZXN0ZWQtYnk6IFdpbGxlbSBkZSBCcnVpam4gPHdpbGxl
bWRlYnJ1aWpuLmtlcm5lbEBnbWFpbC5jb20+Cj4gPgo+ID4gSSBkaWQgbm90IHN1Z2dlc3QgdGhp
cyBjaGFuZ2UuCj4gPgo+IHRoZSBzdWdnZXN0aW9uIGkgbWVhbnQgaGVyZSBpcyBhYm91dCB0aGUg
Zm9sbG93aW5nIHBhcnQKPiAiTm90ZSB0aGF0IGEgbW9yZSBzdHJpY3QgdmVyc2lvbiB0aGF0IGlu
Y2x1ZGVzIF9fdHlwZWNoZWNrIHdvdWxkCj4gd2FybiBvbiB0aGUgdHlwZSBkaWZmZXJlbmNlIGJl
dHdlZW4gdG90YWxfbGVuIGFuZCBjZmdfbXNzLiBGaW5lCj4gd2l0aCBjaGFuZ2luZyB0aGUgdHlw
ZSBvZiBjZmdfbXNzIGluIHRoZSBmb2xsb3ctb24gcGF0Y2ggdG8gYWRkcmVzcwo+IHRoYXQuIgo+
IGFzIG1lbnRpb25lZCBoZXJlIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9DQUY9eUQtKzZj
V1RpRGdwc3U9aFVWK092ekRGUmFUMlpVbXRRbzlxVHJDQjlpLSs3bmdAbWFpbC5nbWFpbC5jb20v
Cj4gSSB0cmllZCB0byBjaGFuZ2UgdGhlIHR5cGUgb2YgY2ZnX21zcyBidXQgaXQgY3JlYXRlcyBh
IGRpZmZlcmVudCB3YXJuCj4gYXQgdWRwZ3NvX2JlbmNoX3R4LmM6MzU0IGJldHdlZW4gY2ZnX21z
cyBhbmQgbGVmdCB0aGF0J3Mgd2F5IGkgY2FzdGVkCj4gaW5zdGVhZC4KPiBhcG9sb2d5IGlmIGkg
bWlzdW5kZXJzdG9vZCB5b3VyIHBvaW50LgoKVGhhbmtzLiBJdCdzIGZpbmUgdG8gYXZvaWQgY2hh
bmdpbmcgdGhlIHR5cGUgb3IgY2FzdCBpZiBpdCBkb2VzIG5vdApzZXQgb2YgYW55IGFsYXJtcy4K
CkkgdGhpbmsgU3VnZ2VzdGVkLWJ5IGlzIGZvciB3aGVuIHRoZSBtYWluIGlkZWEgb2YgdGhlIHBh
dGNoIGlzCnNvbWVvbmUncyBzdWdnZXN0aW9uLiBOb3QgYSBiaWcgZGVhbCwgYnV0IHBsZWFzZSBk
cm9wIGluIHYzLiBJdCdzIHlvdXIKaGFyZCB3b3JrIGFuZCB5b3VycyBvbmx5LiBJJ2xsIGFkZCBt
eSBSZXZpZXdlZC1ieS4KCgoKPiA+ID4gLS0tCj4gPiA+IGNoYW5nZXMgaW4gdjI6Cj4gPiA+IGNh
c3QgdmFyIGNmZ19tc3MgdG8gaW50IHRvIGF2b2lkIHN0YXRpYyBhc3NlcnRpb24KPiA+ID4gYWZ0
ZXIgcHJvdmlkaW5nIGEgc3RyaWN0ZXIgdmVyc2lvbiBvZiBtaW4oKSB0aGF0IGRvZXMgc2lnbmVk
bmVzcyBjaGVja2luZy4KPiA+ID4gLS0tCj4gPiA+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9u
ZXQvTWFrZWZpbGUgICAgICAgICAgfCAyICsrCj4gPiA+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9uZXQvc29fdHh0aW1lLmMgICAgICAgfCA3ICsrKystLS0KPiA+ID4gIHRvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL25ldC91ZHBnc29fYmVuY2hfdHguYyB8IDYgKysrLS0tCj4gPiA+ICAzIGZpbGVz
IGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9NYWtlZmlsZSBiL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL25ldC9NYWtlZmlsZQo+ID4gPiBpbmRleCA3ZjNhYjJhOTNlZDYuLmEw
NmNjMjU0ODlmOSAxMDA2NDQKPiA+ID4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0
L01ha2VmaWxlCj4gPiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9NYWtlZmls
ZQo+ID4gPiBAQCAtMyw2ICszLDggQEAKPiA+ID4KPiA+ID4gIENGTEFHUyA9ICAtV2FsbCAtV2ws
LS1uby1hcy1uZWVkZWQgLU8yIC1nCj4gPiA+ICBDRkxBR1MgKz0gLUkuLi8uLi8uLi8uLi91c3Iv
aW5jbHVkZS8gJChLSERSX0lOQ0xVREVTKQo+ID4gPiArIyBBZGRpdGlvbmFsIGluY2x1ZGUgcGF0
aHMgbmVlZGVkIGJ5IGtzZWxmdGVzdC5oCj4gPiA+ICtDRkxBR1MgKz0gLUkuLi8KPiA+Cj4gPiBX
aHkgZG9lcyBrc2VsZnRlc3QuaCBuZWVkIHRoaXM/IEl0IGRvZXMgbm90IGluY2x1ZGUgYW55dGhp
bmcgZWxzZT8KPiA+Cj4gPiBJJ2QganVzdCBhZGQgI2luY2x1ZGUgIi4uL2tzZWxmdGVzdHMuaCIg
dG8gc29fdHh0aW1lLmMgYW5kIHJlbW92ZSB0aGUKPiA+IHBhdGggY2hhbmdlIGZyb20gdWRwZ3Nv
X2JlbmNoX3R4LmMKPiA+Cj4gPiBGaW5lIHdpdGggdGhpcyBhcHByb2FjaC4gSnVzdCBkb24ndCB1
bmRlcnN0YW5kIHRoZSBjb21tZW50Cj4gPgo+Cj4gdGhlIGNvbW1lbnQgaGVyZSBpcyB3cm9uZyBh
bmQgaXQgc2hvdWxkIGJlIGNoYW5nZWQgdG8gaW5jbHVkZSBwYXRoCj4gbmVlZGVkIHRvIGluY2x1
ZGUga3NlbGZ0ZXN0Lmggb3IgdG8gYmUgZGVsZXRlZAo+Cj4gPiA+Cj4gPiA+ICBURVNUX1BST0dT
IDo9IHJ1bl9uZXRzb2NrdGVzdHMgcnVuX2FmcGFja2V0dGVzdHMgdGVzdF9icGYuc2ggbmV0ZGV2
aWNlLnNoIFwKPiA+ID4gICAgICAgICAgICAgICBydG5ldGxpbmsuc2ggeGZybV9wb2xpY3kuc2gg
dGVzdF9ibGFja2hvbGVfZGV2LnNoCj4gPiA+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9uZXQvc29fdHh0aW1lLmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvc29f
dHh0aW1lLmMKPiA+ID4gaW5kZXggMjY3MmFjMGI2ZDFmLi4yOTM2MTc0ZTdkZTQgMTAwNjQ0Cj4g
PiA+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9zb190eHRpbWUuYwo+ID4gPiAr
KysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvc29fdHh0aW1lLmMKPiA+ID4gQEAgLTMz
LDYgKzMzLDggQEAKPiA+ID4gICNpbmNsdWRlIDx1bmlzdGQuaD4KPiA+ID4gICNpbmNsdWRlIDxw
b2xsLmg+Cj4gPiA+Cj4gPiA+ICsjaW5jbHVkZSAia3NlbGZ0ZXN0LmgiCj4gPiA+ICsKPiA+ID4g
IHN0YXRpYyBpbnQgICAgIGNmZ19jbG9ja2lkICAgICA9IENMT0NLX1RBSTsKPiA+ID4gIHN0YXRp
YyB1aW50MTZfdCAgICAgICAgY2ZnX3BvcnQgICAgICAgID0gODAwMDsKPiA+ID4gIHN0YXRpYyBp
bnQgICAgIGNmZ192YXJpYW5jZV91cyA9IDQwMDA7Cj4gPiA+IEBAIC05Myw4ICs5NSw3IEBAIHN0
YXRpYyB2b2lkIGRvX3NlbmRfb25lKGludCBmZHQsIHN0cnVjdCB0aW1lZF9zZW5kICp0cykKPiA+
ID4gICAgICAgICAgICAgICAgIG1zZy5tc2dfY29udHJvbGxlbiA9IHNpemVvZihjb250cm9sKTsK
PiA+ID4KPiA+ID4gICAgICAgICAgICAgICAgIHRkZWxpdmVyID0gZ2xvYl90c3RhcnQgKyB0cy0+
ZGVsYXlfdXMgKiAxMDAwOwo+ID4gPiAtICAgICAgICAgICAgICAgdGRlbGl2ZXJfbWF4ID0gdGRl
bGl2ZXJfbWF4ID4gdGRlbGl2ZXIgPwo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdGRlbGl2ZXJfbWF4IDogdGRlbGl2ZXI7Cj4gPiA+ICsgICAgICAgICAgICAgICB0ZGVsaXZl
cl9tYXggPSBtYXgodGRlbGl2ZXJfbWF4LCB0ZGVsaXZlcik7Cj4gPiA+Cj4gPiA+ICAgICAgICAg
ICAgICAgICBjbSA9IENNU0dfRklSU1RIRFIoJm1zZyk7Cj4gPiA+ICAgICAgICAgICAgICAgICBj
bS0+Y21zZ19sZXZlbCA9IFNPTF9TT0NLRVQ7Cj4gPiA+IEBAIC0xMjYsNyArMTI3LDcgQEAgc3Rh
dGljIHZvaWQgZG9fcmVjdl9vbmUoaW50IGZkciwgc3RydWN0IHRpbWVkX3NlbmQgKnRzKQo+ID4g
PiAgICAgICAgICAgICAgICAgZXJyb3IoMSwgMCwgInJlYWQ6ICVkQiIsIHJldCk7Cj4gPiA+Cj4g
PiA+ICAgICAgICAgdHN0b3AgPSAoZ2V0dGltZV9ucyhjZmdfY2xvY2tpZCkgLSBnbG9iX3RzdGFy
dCkgLyAxMDAwOwo+ID4gPiAtICAgICAgIHRleHBlY3QgPSB0cy0+ZGVsYXlfdXMgPj0gMCA/IHRz
LT5kZWxheV91cyA6IDA7Cj4gPiA+ICsgICAgICAgdGV4cGVjdCA9IG1heCh0cy0+ZGVsYXlfdXMs
IDApOwo+ID4gPgo+ID4gPiAgICAgICAgIGZwcmludGYoc3RkZXJyLCAicGF5bG9hZDolYyBkZWxh
eTolbGxkIGV4cGVjdGVkOiVsbGQgKHVzKVxuIiwKPiA+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgcmJ1ZlswXSwgKGxvbmcgbG9uZyl0c3RvcCwgKGxvbmcgbG9uZyl0ZXhwZWN0KTsKPiA+ID4g
ZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC91ZHBnc29fYmVuY2hfdHgu
YyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC91ZHBnc29fYmVuY2hfdHguYwo+ID4gPiBp
bmRleCA0NzczOTI3MTVhOWEuLjZiZDMyYTMxMjkwMSAxMDA2NDQKPiA+ID4gLS0tIGEvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvbmV0L3VkcGdzb19iZW5jaF90eC5jCj4gPiA+ICsrKyBiL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC91ZHBnc29fYmVuY2hfdHguYwo+ID4gPiBAQCAtMjUsNyAr
MjUsNyBAQAo+ID4gPiAgI2luY2x1ZGUgPHN5cy90eXBlcy5oPgo+ID4gPiAgI2luY2x1ZGUgPHVu
aXN0ZC5oPgo+ID4gPgo+ID4gPiAtI2luY2x1ZGUgIi4uL2tzZWxmdGVzdC5oIgo+ID4gPiArI2lu
Y2x1ZGUgImtzZWxmdGVzdC5oIgo+ID4gPgo+ID4gPiAgI2lmbmRlZiBFVEhfTUFYX01UVQo+ID4g
PiAgI2RlZmluZSBFVEhfTUFYX01UVSAweEZGRkZVCj4gPiA+IEBAIC0yOTQsNyArMjk0LDcgQEAg
c3RhdGljIGludCBzZW5kX3VkcChpbnQgZmQsIGNoYXIgKmRhdGEpCj4gPiA+ICAgICAgICAgdG90
YWxfbGVuID0gY2ZnX3BheWxvYWRfbGVuOwo+ID4gPgo+ID4gPiAgICAgICAgIHdoaWxlICh0b3Rh
bF9sZW4pIHsKPiA+ID4gLSAgICAgICAgICAgICAgIGxlbiA9IHRvdGFsX2xlbiA8IGNmZ19tc3Mg
PyB0b3RhbF9sZW4gOiBjZmdfbXNzOwo+ID4gPiArICAgICAgICAgICAgICAgbGVuID0gbWluKHRv
dGFsX2xlbiwgKGludCljZmdfbXNzKTsKPiA+ID4KPiA+ID4gICAgICAgICAgICAgICAgIHJldCA9
IHNlbmR0byhmZCwgZGF0YSwgbGVuLCBjZmdfemVyb2NvcHkgPyBNU0dfWkVST0NPUFkgOiAwLAo+
ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNmZ19jb25uZWN0ZWQgPyBOVUxMIDog
KHZvaWQgKikmY2ZnX2RzdF9hZGRyLAo+ID4gPiBAQCAtMzUxLDcgKzM1MSw3IEBAIHN0YXRpYyBp
bnQgc2VuZF91ZHBfc2VuZG1tc2coaW50IGZkLCBjaGFyICpkYXRhKQo+ID4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICBlcnJvcigxLCAwLCAic2VuZG1tc2c6IGV4Y2VlZHMgbWF4X25yX21zZyIp
Owo+ID4gPgo+ID4gPiAgICAgICAgICAgICAgICAgaW92W2ldLmlvdl9iYXNlID0gZGF0YSArIG9m
ZjsKPiA+ID4gLSAgICAgICAgICAgICAgIGlvdltpXS5pb3ZfbGVuID0gY2ZnX21zcyA8IGxlZnQg
PyBjZmdfbXNzIDogbGVmdDsKPiA+ID4gKyAgICAgICAgICAgICAgIGlvdltpXS5pb3ZfbGVuID0g
bWluKGNmZ19tc3MsIGxlZnQpOwo+ID4gPgo+ID4gPiAgICAgICAgICAgICAgICAgbW1zZ3NbaV0u
bXNnX2hkci5tc2dfaW92ID0gaW92ICsgaTsKPiA+ID4gICAgICAgICAgICAgICAgIG1tc2dzW2ld
Lm1zZ19oZHIubXNnX2lvdmxlbiA9IDE7Cj4gPiA+IC0tCj4gPiA+IDIuMzQuMQo+ID4gPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwt
bWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
