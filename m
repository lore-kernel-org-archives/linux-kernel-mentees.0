Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055DCC25B45
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Oct 2023 17:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D0E2612B8;
	Mon, 23 Oct 2023 17:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D0E2612B8
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W1yjpknl
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E0FrabJTvQQt; Mon, 23 Oct 2023 17:26:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3A89E612B3;
	Mon, 23 Oct 2023 17:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A89E612B3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 12A7EC0039;
	Mon, 23 Oct 2023 17:26:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8E651C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 17:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B4E38347D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 17:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B4E38347D
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.a=rsa-sha256 header.s=google header.b=W1yjpknl
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id njY_Njp23V_K
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 17:26:07 +0000 (UTC)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BA06830A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 17:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BA06830A7
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9b95622c620so547948666b.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 10:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1698081964; x=1698686764;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fiki+rx48OzrXJWoYglYJgoiu/eOXoM93dwbSSnqdNw=;
 b=W1yjpknlEWyjVAZyedosAmbXvqZYoyw64ZP82icrGKxjZ+ahf5UImDDpU8gcJeoQic
 ITCuw9EzR1pppADymFiZFq7k/ToZEhYzNvrn5j315OToC/p52jry5/O6mtZvF4ob4HPm
 O6XnmBSoqAmdEwMob3cRwQAtt4PWA1UdG4diE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698081964; x=1698686764;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fiki+rx48OzrXJWoYglYJgoiu/eOXoM93dwbSSnqdNw=;
 b=ZhEQAfSz0jK3x8PrFA2ZnD7PR+TE6XLPby4Wh926Vzhebmfq75xD5Qhi/clqvInW6w
 gbH8L6CfqEqphTf7jn/KlJwwKHJLMQGthvI+MmMK+L7a5wLWHTw0MVQI+Bfu4qK8MwfR
 WDNmA4yJVizkPck0j2fH62Wr/4+OivnSIVPvOCp4hOvZp4y7wGUszX51BRuHi66son5I
 R3oY/mHPsvSUHlmbN/j7xN3mZRNieS6LVGRbyHOqfYL66zpodHZj9/FIYbca4Wn/rL1G
 WReyEObd6qi8FwelHSdBCYwKh4jIg8O4L3QvmeDPY8vyUJUvd+RDTpHEQ70f/UCXrbkU
 H63A==
X-Gm-Message-State: AOJu0YyqTnjR02hqMsdVoBTuJh0sSrG9ZHG9fJDLMnYPw38ZwllTk6ry
 A5IeJoPJ6mayDLpwrJtkumt0wAMrvUriTN+pIcG0gw==
X-Google-Smtp-Source: AGHT+IGfDKYZRvYiQI+UUuYX6N99oN6WpBytLlSYRE5F8YZSESTOrgLBoovYczxg6rGdmG7j7LVxWA==
X-Received: by 2002:a17:907:724d:b0:9ae:4054:5d2a with SMTP id
 ds13-20020a170907724d00b009ae40545d2amr7733548ejc.16.1698081964425; 
 Mon, 23 Oct 2023 10:26:04 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 u17-20020a17090657d100b0099bc8bd9066sm6976305ejr.150.2023.10.23.10.26.03
 for <linux-kernel-mentees@lists.linuxfoundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Oct 2023 10:26:03 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4078fe6a063so4615e9.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 10:26:03 -0700 (PDT)
X-Received: by 2002:a05:600c:3b1b:b0:404:74f8:f47c with SMTP id
 m27-20020a05600c3b1b00b0040474f8f47cmr5652wms.5.1698081963601; Mon, 23 Oct
 2023 10:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <DB3PR10MB683528B8252ED2A802A0E154E8D8A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DB3PR10MB683528B8252ED2A802A0E154E8D8A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Oct 2023 10:25:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W0G6C-=99viHMQaW2REGRQr2xgaejnJmadOdZkoE7AjA@mail.gmail.com>
Message-ID: <CAD=FV=W0G6C-=99viHMQaW2REGRQr2xgaejnJmadOdZkoE7AjA@mail.gmail.com>
Subject: Re: [PATCH] drm: docs: Remove item from TODO list
To: Yuran Pereira <yuran.pereira@hotmail.com>
Cc: neil.armstrong@linaro.org, tzimmermann@suse.de, corbet@lwn.net,
 sam@ravnborg.org, linux-doc@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 linux-kernel@vger.kernel.org, mripard@kernel.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, linux-kernel-mentees@lists.linuxfoundation.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org
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

SGksCgpPbiBNb24sIE9jdCAyMywgMjAyMyBhdCA5OjMx4oCvQU0gWXVyYW4gUGVyZWlyYSA8eXVy
YW4ucGVyZWlyYUBob3RtYWlsLmNvbT4gd3JvdGU6Cj4KPiBTaW5jZSAiQ2xlYW4gdXAgY2hlY2tz
IGZvciBhbHJlYWR5IHByZXBhcmVkL2VuYWJsZWQgaW4gcGFuZWxzIiBoYXMKPiBhbHJlYWR5IGJl
ZW4gZG9uZSBhbmQgbWVyZ2VkIFsxXSwgSSB0aGluayB0aGVyZSBpcyBubyBsb25nZXIgYSBuZWVk
Cj4gZm9yIHRoaXMgaXRlbSB0byBiZSBpbiB0aGUgZ3B1IFRPRE8uCj4KPiBbMV0gaHR0cHM6Ly9w
YXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzU1MTQyMS8KPgo+IFNpZ25lZC1vZmYtYnk6
IFl1cmFuIFBlcmVpcmEgPHl1cmFuLnBlcmVpcmFAaG90bWFpbC5jb20+Cj4gLS0tCj4gIERvY3Vt
ZW50YXRpb24vZ3B1L3RvZG8ucnN0IHwgMjUgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMjUgZGVsZXRpb25zKC0pCgpJdCdzIG5vdCBhY3R1YWxseSBhbGwgZG9u
ZS4gSXQncyBpbiBhIGJpdCBvZiBhIGxpbWJvIHN0YXRlIHJpZ2h0IG5vdywKdW5mb3J0dW5hdGVs
eS4gSSBsYW5kZWQgYWxsIG9mIHRoZSAic2ltcGxlIiBjYXNlcyB3aGVyZSBwYW5lbHMgd2VyZQpu
ZWVkbGVzc2x5IHRyYWNraW5nIHByZXBhcmUvZW5hYmxlLCBidXQgdGhlIGxlc3Mgc2ltcGxlIGNh
c2VzIGFyZQpzdGlsbCBvdXRzdGFuZGluZy4KClNwZWNpZmljYWxseSB0aGUgaXNzdWUgaXMgdGhh
dCBtYW55IHBhbmVscyBoYXZlIGNvZGUgdG8gcHJvcGVybHkgcG93ZXIKY3ljbGUgdGhlbXNlbHZl
cyBvZmYgYXQgc2h1dGRvd24gdGltZSBhbmQgaW4gb3JkZXIgdG8gZG8gdGhhdCB0aGV5Cm5lZWQg
dG8ga2VlcCB0cmFjayBvZiB0aGUgcHJlcGFyZS9lbmFibGUgc3RhdGUuIEFmdGVyIGEgYmlnLCBs
b25nCmRpc2N1c3Npb24gWzFdIGl0IHdhcyBkZWNpZGVkIHRoYXQgd2UgY291bGQgZ2V0IHJpZCBv
ZiBhbGwgdGhlIHBhbmVsCmNvZGUgaGFuZGxpbmcgc2h1dGRvd24gaWYgb25seSBhbGwgcmVsZXZh
bnQgRFJNIEtNUyBkcml2ZXJzIHdvdWxkCnByb3Blcmx5IGNhbGwgZHJtX2F0b21pY19oZWxwZXJf
c2h1dGRvd24oKS4KCkkgbWFkZSBhbiBhdHRlbXB0IHRvIGdldCBEUk0gS01TIGRyaXZlcnMgdG8g
Y2FsbApkcm1fYXRvbWljX2hlbHBlcl9zaHV0ZG93bigpIFsyXSBbM10gWzRdLiBJIHdhcyBhYmxl
IHRvIGxhbmQgdGhlCnBhdGNoZXMgdGhhdCB3ZW50IHRocm91Z2ggZHJtLW1pc2MsIGJ1dCBjdXJy
ZW50bHkgbWFueSBvZiB0aGUKbm9uLWRybS1taXNjIG9uZXMgYXJlIGJsb2NrZWQgd2FpdGluZyBm
b3IgYXR0ZW50aW9uLgoKLi4uc28gdGhpbmdzIHRoYXQgY291bGQgYmUgZG9uZSB0byBoZWxwIG91
dDoKCmEpIENvdWxkIHJldmlldyBwYXRjaGVzIHRoYXQgaGF2ZW4ndCBsYW5kZWQgaW4gWzRdLiBN
YXliZSBhZGRpbmcgYQpSZXZpZXdlZC1ieSB0YWcgd291bGQgaGVscCB3YWtlIHVwIG1haW50YWlu
ZXJzPwoKYikgQ291bGQgc2VlIGlmIHlvdSBjYW4gaWRlbnRpZnkgcGFuZWxzIHRoYXQgYXJlIGV4
Y2x1c2l2ZWx5IHVzZWQgdy8KRFJNIGRyaXZlcnMgdGhhdCBoYXZlIGFscmVhZHkgYmVlbiBjb252
ZXJ0ZWQgYW5kIHRoZW4gd2UgY291bGQgcG9zdApwYXRjaGVzIGZvciBqdXN0IHRob3NlIHBhbmVs
cy4gSSBoYXZlIG5vIGlkZWEgaG93IGVhc3kgdGhpcyB0YXNrIHdvdWxkCmJlLiBJcyBpdCBlbm91
Z2ggdG8gbG9vayBhdCB1cHN0cmVhbSBkdHMgZmlsZXMgYnkgImNvbXBhdGlibGUiIHN0cmluZz8K
CkkndmUgZ290dGVuIHNpZGUtdHJhY2tlZCBhdCB0aGUgbW9tZW50IHNvIEkgaGF2ZW4ndCBiZWVu
IGRyaXZpbmcKcHJvZ3Jlc3Mgb24gdGhpcyB2ZXJ5IHF1aWNrbHkuIEkgc3RpbGwgcGxhbiB0byBw
b2tlIHNvbWUgb2YgdGhlCmRybV9hdG9taWNfaGVscGVyX3NodXRkb3duKCkgcGF0Y2hlcyBldmVu
dHVhbGx5Li4uCgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMzA4MDQxNDA2MDUu
UkZDLjQuSTkzMDA2OWEzMmJhYWI2ZmFmNDZkNmIyMzRmODk2MTNiNWNlYzBmMTRAY2hhbmdlaWQK
WzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMzA5MDEyMzQwMTUuNTY2MDE4LTEtZGlh
bmRlcnNAY2hyb21pdW0ub3JnClszXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMwOTAx
MjM0MjAyLjU2Njk1MS0xLWRpYW5kZXJzQGNocm9taXVtLm9yZwpbNF0gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvci8yMDIzMDkyMTE5Mjc0OS4xNTQyNDYyLTEtZGlhbmRlcnNAY2hyb21pdW0ub3Jn
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtl
cm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51
eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
