Return-Path: <SRS0=zqa/=NN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EEF5C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 22 Aug 2021 18:23:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A05B6126A
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 22 Aug 2021 18:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A05B6126A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2E5A4034B;
	Sun, 22 Aug 2021 18:23:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UxRu_C1XBA-U; Sun, 22 Aug 2021 18:22:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9610440289;
	Sun, 22 Aug 2021 18:22:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D584C001A;
	Sun, 22 Aug 2021 18:22:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 69E1AC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 18:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 592D7605E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 18:22:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X8uJJU_zxNQG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 18:22:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D254A605B7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 18:22:52 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id v19so7699003lfo.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 11:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZcjkqRHNaGKBj9ePxq0+XIIdaVIL7UqXAEt62MOBiIg=;
 b=BnJD96l4dH0FEHCEL5MAXBhjbbpxr08iOLMhbpaCw6ohJc9tr2sIVux61JbmKwJxaq
 MrXpuRFxN4j+6pHwfaecQ9jWHD2skjn1aeur+OqRgDsd6bcmHVM1t5yhCGJUA/S2uL16
 wHWsy40PkESSSTLHeXtPKZUCEm/EouY0QdYzyTinwpnq/z6Bem4orAmrOuG/BdCael48
 yph72g33TvQ5t0Fv3IM0/H5W9nzzKDGNv6bYn0/i5ZQ4w+ak+A7SlBcss3KJ4Imt0P5q
 KCEJTiSxwMZT/Pig2Nes7lmtPZ/ZsxHjXI+ZWmpI7oPJFRcztpXAniy+yHh4C7KNWwrC
 7y3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZcjkqRHNaGKBj9ePxq0+XIIdaVIL7UqXAEt62MOBiIg=;
 b=MF61PtAPfMmthrACzHlgCe93peIs2WeDNKtBIaBm/7lt+xA30gmPdLeIb3hi3gpgsh
 1C5vWnx5NdPPIdYwmCeAhylElSa+zXiXh0CgNWYgUr4CyzYm+C1yRhjb5U2u9SPnoHuV
 i58CLWIc19D9qK+fQB6LBhCK+NcFkDqPcf0Pret4sXrg8IyaYsTv8dYiYf7aM7ta61CJ
 JHgy5WjFUt0a30eMC4J2trZB+q4FaOPIJ8RBIYvsrlrTBWmmryyqPgTNR/ukB8UqKz/q
 y07CE8BERhRRd4TR2UUBbB+w1rln1RnFj0BSotX6K68jaL7VhRTW8Qb+qYXAqDfkUsNx
 JHlw==
X-Gm-Message-State: AOAM5333hwg3yGwbsjJNzDh5OLsHvTTANgCltKiCI2/WJ+4jxFYzU+QB
 F4ryJby1rBgP16VlyyDJTAS30Jy7qM5aXAFM+lc=
X-Google-Smtp-Source: ABdhPJxHcCbdAe7yLOr/YG8GziGH5yHDeW32Ag7MZQaTuQTDE9qiJEeJ4s7+xYJ1LdEPA3IoF38mLGeGRbc7Y3JRRn8=
X-Received: by 2002:a19:5059:: with SMTP id z25mr3141718lfj.437.1629656570681; 
 Sun, 22 Aug 2021 11:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <CANzSgSkBGm3aLx_iOdXp=HfWwOoga_CuQTGA++CX4YgVNWgBdw@mail.gmail.com>
In-Reply-To: <CANzSgSkBGm3aLx_iOdXp=HfWwOoga_CuQTGA++CX4YgVNWgBdw@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 22 Aug 2021 23:52:39 +0530
Message-ID: <CABJPP5BHfLTAiBsVj79tSSJPBwTpGqFTjJNpZq=FHVfZCHNNqA@mail.gmail.com>
Subject: Re: Checkpatch Documentation mentorship program
To: =?UTF-8?Q?Luna_S=C3=A1nchez?= <lunasanchez@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

T24gRnJpLCBBdWcgMTMsIDIwMjEgYXQgMjo1MiBQTSBMdW5hIFPDoW5jaGV6IDxsdW5hc2FuY2hl
ekBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGVsbG8sCj4KPiBJIGFtIGludGVyZXN0ZWQgaW4gdGhl
IENoZWNrcGF0Y2ggRG9jdW1lbnRhdGlvbiBtZW50b3JzaGlwIHByb2dyYW0gYW5kIEkgd291bGQg
bGlrZSB0byB3b3JrIG9uIHRoZSB0YXNrcyBmb3IgdGhlIG1lbnRlZSBzZWxlY3Rpb24uCj4KPiBU
aGFuayB5b3UgYW5kIGJlc3QgcmVnYXJkcywKPgo+IEx1bmEgU2FuY2hlegoKVGhhbmtzIGZvciB5
b3VyIGludGVyZXN0IGluIHdvcmtpbmcgd2l0aCB0aGUgY2hlY2twYXRjaCBkb2N1bWVudGF0aW9u
LgoKVGhlIHplcm90aCB0YXNrIGlzIHRvIGxlYXJuIHN1aXRhYmxlIG5ldGlxdWV0dGUgZm9yIHRo
ZSBjb21tdW5pY2F0aW9uIHdpdGgKdGhlIGtlcm5lbCBjb21tdW5pdHkuIEJlbG93IGFyZSBzb21l
IGJhc2ljIHJ1bGVzIGFuZCBwb2ludGVycyBmb3IgdGhpcwptZW50b3JzaGlwLiBNb3JlIGluZm9y
bWF0aW9uIG9uIGtlcm5lbCBuZXRpcXVldHRlIGlzIGFsc28gYXQKaHR0cHM6Ly9wZW9wbGUua2Vy
bmVsLm9yZy90Z2x4L25vdGVzLWFib3V0LW5ldGlxdWV0dGUuCgpGaXJzdCwgcGxlYXNlIGRvIG5v
dCB0b3AtcG9zdC4KCiAgICBBOiBCZWNhdXNlIHdlIHJlYWQgZnJvbSB0b3AgdG8gYm90dG9tLCBs
ZWZ0IHRvIHJpZ2h0LgogICAgUTogV2h5IHNob3VsZCBJIHN0YXJ0IG15IHJlcGx5IGJlbG93IHRo
ZSBxdW90ZWQgdGV4dD8KCiAgICBBOiBCZWNhdXNlIGl0IG1lc3NlcyB1cCB0aGUgb3JkZXIgaW4g
d2hpY2ggcGVvcGxlIG5vcm1hbGx5IHJlYWQgdGV4dC4KICAgIFE6IFdoeSBpcyB0b3AtcG9zdGlu
ZyBzdWNoIGEgYmFkIHRoaW5nPwoKICAgIEE6IFRoZSBsb3N0IGNvbnRleHQuCiAgICBROiBXaGF0
IG1ha2VzIHRvcC1wb3N0ZWQgcmVwbGllcyBoYXJkZXIgdG8gcmVhZCB0aGFuIGJvdHRvbS1wb3N0
ZWQ/CgogICAgQTogWWVzLgogICAgUTogU2hvdWxkIEkgdHJpbSBkb3duIHRoZSBxdW90ZWQgcGFy
dCBvZiBhbiBlbWFpbCB0byB3aGljaCBJJ20gcmVwbHlpbmc/CgpTZWNvbmQsIHBsZWFzZSBhbHdh
eXMgQ0M6IGxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcuCgpU
aGlyZCwgc2V0IHVwIHlvdXIgZW1haWwgY2xpZW50IGFjY29yZGluZyB0byB0aGUga2VybmVsIGNv
bW11bml0eQpydWxlcy4gSGVyZSBpcyBzb21lIGluZm9ybWF0aW9uIHRvIHRoYXQ6CgpodHRwczov
L3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hl
cy5odG1sI25vLW1pbWUtbm8tbGlua3Mtbm8tY29tcHJlc3Npb24tbm8tYXR0YWNobWVudHMtanVz
dC1wbGFpbi10ZXh0Cmh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L3Byb2Nl
c3MvZW1haWwtY2xpZW50cy5odG1sCgpHZW5lcmFsbHkgbW9yZSBpbmZvcm1hdGlvbiBvbiBzdWJt
aXR0aW5nIHBhdGNoZXMgYW5kIHJlc3BvbmRpbmcgb24KcmVwbGllcyBpcyBhdCBodHRwczovL3d3
dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5o
dG1sCgpPbmNlIHRoZSB6ZXJvdGggdGFzayBpcyB1bmRlcnN0b29kLCB5b3UgY2FuIG5vdyBtb3Zl
IG9uIHRvIHRoZSBmaXJzdAp0YXNrOiBSdW5uaW5nIGNoZWNrcGF0Y2ggb24gYSBzcGVjaWZpYyBm
aWxlLgoKR2V0IGEgY2xvbmUgb2YgdGhlIExpbnV4IGtlcm5lbCByZXBvc2l0b3J5LgpUaGUgc2Ny
aXB0IGNoZWNrcGF0Y2gucGwgaXMgdW5kZXIgdGhlIHNjcmlwdHMgZGlyZWN0b3J5LgoKVGhlbiwg
dGhlIGZpcnN0IHRhc2sgaXMgdG8gcnVuIGNoZWNrcGF0Y2gucGwgb24gYSBmZXcgZmlsZXMgYmVs
b3cKYW5kIHNoYXJlIHRoZSByZXN1bHRzOgoKZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZp
dl9tbXUuaApkcml2ZXJzL2dwdS9kcm0vdmdlbS92Z2VtX2ZlbmNlLmMKCldoaWNoIGluZm9ybWF0
aW9uIG9uIHRoZXNlIHJ1bGVzIHRoYXQgY2hlY2twYXRjaCB3YXJucyBhYm91dAppcyBhdmFpbGFi
bGUgaW4gdGhlIENoZWNrcGF0Y2ggRG9jdW1lbnRhdGlvbj8KCklmIGRvY3VtZW50YXRpb24gb2Yg
dGhlc2UgcnVsZXMgaXMgYXZhaWxhYmxlLCBleHBsYWluIHlvdXIKdW5kZXJzdGFuZGluZyBvZiB0
aGUgcnVsZXMgaW4geW91ciBvd24gd29yZHMuCklmIG5vIGluZm9ybWF0aW9uIGlzIGF2YWlsYWJs
ZSBpbiB0aGUgZG9jdW1lbnRhdGlvbiwKZXhwbGFpbiB5b3VyIHVuZGVyc3RhbmRpbmcgb2YgdGhl
IHJ1bGUuCgpJbiBhbnkgY2FzZSwgZXhwbGFpbiB0aGUgdmlvbGF0aW9uIHRoYXQgaXMgY2hlY2tl
ZCBhbmQgcmFpc2VkIGluIHRoZQpjaGVja3BhdGNoIHNjcmlwdCwgaS5lLiwgd2hhdCBpcyBpbXBs
ZW1lbnRlZCBpbiBjaGVja3BhdGNoIHRvIGNoZWNrCnRoZSBydWxlIGFuZCBwb3NzaWJsZSB2aW9s
YXRpb25zLiBXaGljaCBjb2RlIGluIHRoZSBjaGVja3BhdGNoIHNjcmlwdAppcyByYWlzaW5nIHRo
ZSB3YXJuaW5nPyBXaGF0IGRvZXMgaXQgY2hlY2sgYW5kIGhvdyBpcyB0aGF0CmltcGxlbWVudGVk
PwoKRXhwbGFpbiBob3cgdG8gcG9zc2libHkgZml4IHRoaXMgY29kZSB3aXRoIHJlZ2FyZHMgdG8g
dGhhdCB2aW9sYXRpb24uCgpPbmNlIHlvdSBzdWNjZWVkIG9uIHRoaXMgZmlyc3QgdGFzaywgd2Ug
aW5mb3JtIHlvdSBhYm91dCB0aGUgZnVydGhlcgpzZWNvbmQgYW5kIHRoaXJkIHRhc2suIElmIHlv
dSBmYWlsIG9uIGFueSBvZiB0aG9zZSB0YXNrcywgeW91IGFyZSBvdXQKb2YgdGhlIHNlbGVjdGlv
biBwcm9jZXNzLgoKVGhlIHNlbGVjdGlvbiBvZiB0aGUgbWVudGVlIHdpbGwgaGFwcGVuIGFjY29y
ZGluZyB0byBzY2hlZHVsZSwKYXQgZWFybGllc3Qgb24gQXVndXN0IDEydGggYW5kIGF0IGxhdGVz
dCBhdCB0aGUgZW5kIG9mIEF1Z3VzdC4KTW9yZSBpbmZvcm1hdGlvbiBpcyBhdmFpbGFibGUgYXQK
aHR0cHM6Ly9kb2NzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbGZ4L21lbnRvcnNoaXAvbWVudG9yc2hp
cC1wcm9ncmFtLXRpbWVsaW5lcy4KCkFsbCB0aGUgYmVzdCwKRHdhaXBheWFuLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVl
cyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9u
Lm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1rZXJuZWwtbWVudGVlcwo=
