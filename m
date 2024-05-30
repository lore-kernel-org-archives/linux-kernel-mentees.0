Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7E3142E69
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 May 2024 03:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717040779; cv=none; b=mm1sm0IfDzWos/aHGBqHoh/fZR7fnWOfbyRSzZ2VT1cImWfb+qDij/ajz1mZMSAUKoDMnCEbaRNlFTIJaf3xdApqvQ3Zn31oKxoSUzZVWdJ4OtR48aZhgMx1rBokW35begC9WyigFtDyQ2FOcJj1vFKCTnV7C6EjtokrSJR+yUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717040779; c=relaxed/simple;
	bh=6L11tRl35HQmv/mFBk8LfSjuDV9F1thr5rxj67BCpPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cPgSoLk+Hw799KdGnUUNX4ZNE5xeQG7oVcXs/dTUR46knBwAnq0uCau0xGaiq5d6pUKsbs+3/cLOJYL6/oMnxo2kEKdQjJ6LLHw4YCaHft/VAVSe0obe865aTmzsMYy8s1so0XACG2kHJPqKs6xUhc56FBaIpoiszw29Ob7kMTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DIjI4Bw2; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DIjI4Bw2"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 188BA4137D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 May 2024 03:46:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GqAlA4yinWVJ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 May 2024 03:46:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::a33; helo=mail-vk1-xa33.google.com; envelope-from=austindh.kim@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5DF0D402E4
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DF0D402E4
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DIjI4Bw2
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5DF0D402E4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 May 2024 03:46:16 +0000 (UTC)
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-4e18a9a6658so161002e0c.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 May 2024 20:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717040775; x=1717645575; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6L11tRl35HQmv/mFBk8LfSjuDV9F1thr5rxj67BCpPM=;
        b=DIjI4Bw2OeEVq96hZR/XX/+5W8bS+6iF+LAWdyqEKVFrUzKC5n5Rhvy15sg3Pw9/hB
         NEwrnC5Pomfv+vBIyICU6WIhwsLHLi4zrYxdPOs2D+fEAs7Xiq8Oe8Nlcbz3tG4Gd632
         VSqQU6B4kpTstk6SHXA28ggj7YWTLPrmPY7Sx2mOFygeK4t6Rp/8d1R6n/gUNFkOHwrY
         2plqcBnjybPwrw7Bkij+dNyxhVGVrk9Vbu9p2Gq4S8f/+RCQVED1CU4BJkWza1Z/eFTb
         Ci3TAk67tV6PaV6SLzJ0T3P78w27XCo/hjsRd8tI2m+t7pe2yeRLm6/JiApKxxXnKLd8
         gufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717040775; x=1717645575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6L11tRl35HQmv/mFBk8LfSjuDV9F1thr5rxj67BCpPM=;
        b=osvc7lZGNYg7W2OXbQzGUfCLSV0KOCFDQZPpFkWMOK5bE97PrEhIupxoIAZRNH7hqK
         wgR1s7cJQlgsOX/ntz8DCs1y1jXu74b6kR+j/PaNDX8pyeieiZApQMG6P0/SFDLiIDDG
         fTu+mbPAuR9vrlSb/v43+KdwK+/gBfM7Pj4U5UqAi4VjJVk7hzf38ltkkVSUv5aNfw3C
         IbE1Qgec39LKySE3jxeb7hSj73yV/ZEoOH7NRzLCZEJ0xC0PGoQhRTbk7SkuGWstTk54
         GpY3IE6IFYvJg3+UsdVuKchWx3136/CxiNVzwslA5MkKMrOZWC6VtWJ/2wHGEwHqdckT
         djDA==
X-Forwarded-Encrypted: i=1; AJvYcCXEdTWcA0Rm1UEEH/Xk/JINc6yDvDx38d0RccU+0ils72d0Wzc91m50gtGZlqemUjqB8HLlJ28c+H5kUgProi4l7K+KPi+rghZ9ni0izxZNztIzFJB0r4KJCqiV9URD
X-Gm-Message-State: AOJu0YwTfCSz76kJVQ1AgV93Z52MtNoEmQAXeu0foN69Kl7+CI0Mql9P
	UnjEjQ5+yQcCuB5mlQU71uAggtKbMVqE5Xjd5m0dEs/jMOog/0+fL+1cNaW7fSxRLNxAX2gTLOs
	Ggsq7uAQ+UzgF6m6Lcg0aYthXdlw=
X-Google-Smtp-Source: AGHT+IF85Nlu3c7uPVn5bMKIYbYvGkSUcAqsd5Huh0o6ZADdaGmNHXy7hxzw5zvNdX/lonak2rM8KZDHGNaZj1IXUiA=
X-Received: by 2002:a67:b34c:0:b0:48b:a8ef:5942 with SMTP id
 ada2fe7eead31-48baea8f7afmr968789137.35.1717040774677; Wed, 29 May 2024
 20:46:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240527102313.27966-1-yskelg@gmail.com>
In-Reply-To: <20240527102313.27966-1-yskelg@gmail.com>
From: Austin Kim <austindh.kim@gmail.com>
Date: Thu, 30 May 2024 12:46:03 +0900
Message-ID: <CADLLry53yZ6PZ7X8DwdS=GGp6+6L0tbAkb+hiL-Eth4FZ+ZTNw@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: cve Korean translation
To: yskelg@gmail.com
Cc: Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org, 
	Jinwoo Park <pmnxis@gmail.com>, shjy180909@gmail.com, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCjIwMjTrhYQgNeyblCAyN+ydvCAo7JuUKSDsmKTtm4QgNzoyNCwgPHlza2VsZ0Bn
bWFpbC5jb20+64uY7J20IOyekeyEsToNCj4NCj4gRnJvbTogWXVuc2VvbmcgS2ltIDx5c2tlbGdA
Z21haWwuY29tPg0KPg0KPiBUaGlzIGlzIGEgRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2N2ZSBrb3Jl
YW4gdmVyc2lvbi4NCj4NCj4gU2lnbmVkLW9mZi1ieTogWXVuc2VvbmcgS2ltIDx5c2tlbGdAZ21h
aWwuY29tPg0KPiAtLS0NCj4gIC4uLi90cmFuc2xhdGlvbnMva29fS1IvcHJvY2Vzcy9jdmUucnN0
ICAgICAgICB8IDEwNyArKysrKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMDcg
aW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNs
YXRpb25zL2tvX0tSL3Byb2Nlc3MvY3ZlLnJzdA0KPg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi90cmFuc2xhdGlvbnMva29fS1IvcHJvY2Vzcy9jdmUucnN0IGIvRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMva29fS1IvcHJvY2Vzcy9jdmUucnN0DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uOTQ2MTBjMTc3ZjE3DQo+IC0tLSAvZGV2L251bGwNCj4g
KysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMva29fS1IvcHJvY2Vzcy9jdmUucnN0DQo+
IEBAIC0wLDAgKzEsMTA3IEBADQo+ICsuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MA0KPiArDQo+ICs6T3JpZ2luYWw6IERvY3VtZW50YXRpb24vcHJvY2Vzcy9jdmUucnN0DQo+ICs6
VHJhbnNsYXRvcjogWXVuc2VvbmcgS2ltIDx5c2tlbGdAZ21haWwuY29tPg0KPiArDQo+ICs9PT09
PT09PT09DQo+ICtDVkUg7ZWt66qp65OkDQo+ICs9PT09PT09PT09DQo+ICsNClsuLi5dDQo+ICsN
Cj4gK+yemOuqu+uQnCBDVkUg7ZWt66qp65OkDQo+ICs9PT09PT09PT09PT09PT09PQ0KPiArDQo+
ICvtirnsoJUg67Cw7Y+s7YyQ7JeQ7IScIOuzgOqyveuQnCDsgqztla0g7KCB7Jqp7ZWcIOuwsO2P
rO2MkOydgCDrjZQg7J207IOBIGtlcm5lbC5vcmcg7KeA7JuQIOumtOumrOyKpOqwgA0KPiAr7JWE
64uMIOy7pOuEkCDrsoTsoITsnYQg7KeA7JuQ7ZWp64uI64ukLiDrlYzrrLjsl5AgTGludXgg67Cw
7Y+s7YyQ7JeQ7ISc66eMIOyngOybkOuQmOuKlCBMaW51eCDsu6TrhJDsl5DshJwNCj4gK+uztOyV
iCDrrLjsoJzqsIAg67Cc6rKs65CY64qUIOqyveyasCBMaW51eCDsu6TrhJAgQ1ZFIO2MgOyXkOyE
nCBDVkXrpbwg7ZWg64u57ZWgIOyImCDsl4bsirXri4jri6QuDQo+ICvrs4Dqsr3rkJwg7IKs7ZWt
7J2EIOyggeyaqe2VnCDtirnsoJUgTGludXgg67Cw7Y+s7YyQIOyekOyytOyXkCDsmpTssq3tlbTs
lbwg7ZWp64uI64ukLg0KDQpJdCBpcyBhIGxpdHRsZSBiaXQgaGFyZCB0byB1bmRlcnN0YW5kIHRo
ZSBhYm92ZSBzZWN0aW9uIGRlc2NyaWJpbmcNCidJbnZhbGlkIENWRXMnLg0KUGxlYXNlIHJlZmVy
IHRvIHRoZSBmb2xsb3dpbmcgc2VudGVuY2VzIGlmIHlvdSBjb25zaWRlciByZXZpc2lvbiBvZiB0
aGlzIHBhZ2UuDQoNCi0tLQ0K7Jyg7Zqo7ZWY7KeAIOyViuydgCBDVkUg7ZWt66qp65OkDQoNCuuz
tOyViCDsnbTsiojqsIAg7Yq57KCVIOuwsO2PrO2MkOyXkOyEnCDtmZXsnbjrkJjrqbQg7Yq57KCV
IOuwsO2PrO2MkOyXkCDrs4Dqsr0g7IKs7ZWt7J20IOyggeyaqeuQqeuLiOuLpC4NCuydtCDrs4Dq
sr0g7IKs7ZWt7J20IGtlcm5lbC5vcmfsl5Ag7KCB7Jqp65CY7KeAIOyViuycvOuptCwgTGludXgg
7Luk64SQIENWRSDtjIDsl5DshJwgQ1ZF66W8IO2VoOuLue2VoCDsiJgg7JeG7Iq164uI64ukLg0K
64yA7IugIOuzgOqyveuQnCDsgqztla3snbQg7KCB7Jqp65CcIO2KueyglSBMaW51eCDrsLDtj6zt
jJAg7J6Q7LK07JeQIOyalOyyre2VtOyVvCDtlanri4jri6QuDQotLS0NCg0KVGhhbmtzIGZvciBk
ZWRpY2F0aW9uLCBldmVyeWJvZHkga25vd3MgdGhhdCBpdCBpcyBjaGFsbGVuZ2luZw0KdG8gY2Fy
cnkgb3V0IHRyYW5zbGF0aW9uIHdvcmsuDQoNCkJSLA0KQXVzdGluIEtpbQ0KDQo+ICsNClsuLi5d
DQo+ICvslYrsnYAg7J2867aAIOuzgOqyvSDsgqztla3snbQg6rSA66Co7ISx7J20IOyeiOydhCDs
iJgg7J6I64uk6rOgIOqwgOygle2VqeuLiOuLpC4NCj4gLS0NCj4gMi4zNC4xDQo+DQo=
