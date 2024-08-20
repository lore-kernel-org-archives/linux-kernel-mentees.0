Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBCF18C01B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Aug 2024 09:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724146299; cv=none; b=khtBYxOIpql/4dXD/ON6dy9W3J44JwWbF56dpAa8xv2wJzSBkUz6W/zi9sBO4S9Gp6bPG+c3eB8cwqSi/50NGZ8NJd2PJSSKiFpeGoTMq1CfL6mICNmn5SdACUQeMHqV6+IDmxOxYI7MU6fqWqyZT306poeRZCFqDn3vXZXLzqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724146299; c=relaxed/simple;
	bh=eFTi7zeLLmMAQd57ugmudMTtpCqN7XW5pg8v+Im63kE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Yc0NeCvSWYgUA17FkVWLOPAN/o8ORoq9KpnGrq8AC2zhMNJ7Y8flArGFbua0bGMXMrFytCGhlZom4q9I08+ycV5h4ehA4Mx99r7qMeC4a14pxOqIDC6yfHiurVjSWp7jttZzbea6dYp5/yBV+/EZJHZKyqCx2pI63QzvoHXAwoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nDei9Fdt; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nDei9Fdt"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E117C608AA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Aug 2024 09:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QNjKjv6z_P1z for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Aug 2024 09:31:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=neil.armstrong@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C3E18608A4
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=linaro.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3E18608A4
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nDei9Fdt
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C3E18608A4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Aug 2024 09:31:36 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4280ee5f1e3so42372475e9.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Aug 2024 02:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724146294; x=1724751094; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dR0CreoU8vpVj47jDOdAp+cTu5413/pQZmWvPzZH2KA=;
        b=nDei9FdtV9SB1nBgTXBEQwr6MifNYh2ntFTrOY5TpQ/SiWejvrDThI45OvPC7+rUoC
         UqJxYeSfs6+kfSgsn4T59zZWC4aDD0xIQA4lC2hct+3JjEhbBWkt8b7f1r1lJQMBEyxG
         uOMcLY4VImITCDvwTdQKbPUSpArM/SL9oaGRxnDG/FA0TWW8EAz3A6jfG8pxrf1s3Wha
         5+cgcZNuM99cm/6Ewn6H4cyEkXpIm4MBxwgk6ckqtQq28BeaWG+Gq9LA+gKHRr3wZF4l
         CS5uZLc0MCNVcT6RRgf/dZb5Mxoa33g4UurlVFkX7H1yKhNLW9ew9JCn6mrwZ66wa534
         LhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724146294; x=1724751094;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dR0CreoU8vpVj47jDOdAp+cTu5413/pQZmWvPzZH2KA=;
        b=P24Y05tazDxeKVBFYHHWQ8/Hr4Q2OoIFHoXJv1OCpYpnw9kh5r50Yz6YpnzE3EjtPF
         NSt9UDY9Usr3fJwT9WtxNW2+2ZaQlrpnQZGlRPAJoKALDCwsbrkRvppoci9fgjO/ipqm
         MCa7uUfsCmFTWpr9GOHTbMAOw38u4+CGFqdt2Ry6E2A0Xfwrp0PpJshPBLmyxC8OvcqQ
         pZExyZQi4N5UA8rhNekGOeLBGBUMP7zUfTuFghrnFPBsHVtwYsjlXdoYIUtNVsUH5413
         uR0M9geC9jVSQoBmd2YAZpXinX1lLoJlzoRMeozUg2acAvC4q0mxJuFtcj/Z+GMnj3y7
         Ud8w==
X-Forwarded-Encrypted: i=1; AJvYcCU9f6/+JPLKVwRWbYKKJ51LwtUb+9eVbul+2f24rNJXnx48vdeyhaEk0eg3Bdm/wB9NDsBJMfpq3RP5l5tGwXThtpd5nA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzIKryAIdCW2S2MsZ+rSG8ot6OMpEQZKYnBYZjiEfiH1zkDHk9D
	qCIXgzPCfIDMWH2sJ/1Q93T5Wj4LZhWUeOCiGit/OOPaGNUlTOg+HQRCW7TUons=
X-Google-Smtp-Source: AGHT+IHX+zBO3kMosl5V3wdA7ekb2kmacB5cUU/l4MDgeLTQn+W+q0tXM80DVANeQt+/R4mbjOcPgQ==
X-Received: by 2002:a05:600c:4f8d:b0:427:d713:a5d3 with SMTP id 5b1f17b1804b1-429ed79daa4mr89507445e9.11.1724146293900;
        Tue, 20 Aug 2024 02:31:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed648f00sm136597505e9.7.2024.08.20.02.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 02:31:33 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
 skhan@linuxfoundation.org, rbmarliere@gmail.com, 
 linux-kernel-mentees@lists.linuxfoundation.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240819175122.33176-1-abhishektamboli9@gmail.com>
References: <20240819175122.33176-1-abhishektamboli9@gmail.com>
Subject: Re: [PATCH v2] drm/panel: ili9341: Add comments for registers in
 ili9341_config()
Message-Id: <172414629306.2571141.1078174341276677864.b4-ty@linaro.org>
Date: Tue, 20 Aug 2024 11:31:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0

Hi,

On Mon, 19 Aug 2024 23:21:22 +0530, Abhishek Tamboli wrote:
> Add detail comments for registers definitions in struct ili9341_config().
> Replace TODO with comment for each registers.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: ili9341: Add comments for registers in ili9341_config()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1453323eac4f13817a07f40e78e76dfc635aab34

-- 
Neil

