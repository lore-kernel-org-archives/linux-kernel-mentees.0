Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188D41119C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Feb 2024 01:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707873931; cv=none; b=iAYIc0qSYggZ6RpbjSHElHukPfE9eomXlBaiiAkdbCIW2uGXdyhkT3+YY8jte0s6dpFCAIc3Nw/NIcbSKqSA5s7M30c/z1y7VvCFkAk9fBguLP2pkQrkfwrbnP0PDp1ZwxGR62BaWmJOnqEqc6uakHSaIDVaFeW5BGNeSjc7z6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707873931; c=relaxed/simple;
	bh=BxrbZG78mhySk/vs4GuYCVqBb7nK8xSAta5ewnnEwbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H/rJRX9KWkCAEudJO8IROh36B3n7oewWXu9k5UIWrTI2dGNp90VfQ1+7MQa4/nZSTQAHQDjq0jNFyuPTS70kDoqJSjsESfYU09+DBGeOjOM++TTVlzf/viwsOyqp2rF7ghD7YaMZI3P18OiD6SQIjr8s0hE2nNwNAGB9unbkJx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IOoPtVhM; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IOoPtVhM"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BE6040434
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Feb 2024 01:25:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ho8VoW-CFek1
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 14 Feb 2024 01:25:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4860:4864:20::33; helo=mail-oa1-x33.google.com; envelope-from=andrewjballance@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9198740169
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9198740169
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IOoPtVhM
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9198740169
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Feb 2024 01:25:28 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-216f774c827so2368884fac.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 13 Feb 2024 17:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707873927; x=1708478727; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8sLqoPJITx4zipG5AwnBaabPkeaccv/ydfFvCORtqBw=;
        b=IOoPtVhMgkI6RZXVsFYl8+f2ElafqlLV+Pr01tiy/Lie03YGRgMF6f6D52x60iDF3D
         wVxSJar1QXwGZF0lJLuSkVfpHxq24JJXbPZP0tiZl32yoOEYoIk9yVJr68bVXr2G9Swu
         DSdH7B00C6cbaU5xjpmi81XMwpYdyCEJL3g8xkbzwlGHTRZzmTDLw8eLZVDgZ3lcRx+Q
         pdPx/X0R3Oibs9W5x8XnoYqIKK9pOcoQHBMQvDMcmYWutXVHwbJo30yK23cA7PdwvJ+V
         DhNtnynhlAwDWknJQugqjiTgB2EqZAnlIwa+96FB56tudiKnnbCuJZukteK3n+UKVb9N
         RysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707873927; x=1708478727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8sLqoPJITx4zipG5AwnBaabPkeaccv/ydfFvCORtqBw=;
        b=lTqwGpQ6nbQwBBYedlCZaZ5tcS+T09at70jmmWlpIPfc1yG792xFVmvPetErTO0vot
         MJDdYyJ52rJMcB/V1AkjdtekovQUBmMsoM6NJ6VK4dP+8AvdasUNvuGcWz0tHx2r6ZM9
         xeZeBOozAzAyOPVEijgxa+CA/73zqiZD4pQtYJenTyyKkfOS/aDsqEPurYWwUPfMUBUg
         IoZ5icwq37C4iABX5Rug9mTsfxJjPbtc15K1Us7j7kT9XIa0xY9776sZNRqmvyWDW2pc
         0fQMzM4ZI76IRb/kUijzQeB+wP5SiONxWPXG/RIv7acHA6aDBC/j5ovATybwPVKF/RHT
         yazg==
X-Forwarded-Encrypted: i=1; AJvYcCWWUUtxdm+OMdsNUnLZgpvriFsFRDuB9M403L7Lb/VqadZooPwHhopqJKSS7q5lgafDB+V86WBeqq6wSpY/lbRlEJshu+L7FwUS8swzpd4TeSfAS3zsw/PbFvT2adR8
X-Gm-Message-State: AOJu0Yyin1fHdM0QPfbxda973ZlYpACkLYLtYtUrPhkkAC8FaJKqMd1L
	0Vd1fSUpfGNnachyyvdFtYiHIninxIMv6AXHZdJ+SQ26r+8JBYEK
X-Google-Smtp-Source: AGHT+IEXUKD+kOvDwLyOq7rOMY2ofbBYCXU7nT5An8YIVT6QAm8hMjllt2cNtqjDQzKdUahNpNrc3A==
X-Received: by 2002:a05:6871:1cc:b0:21a:866e:f4da with SMTP id q12-20020a05687101cc00b0021a866ef4damr1083554oad.52.1707873927452;
        Tue, 13 Feb 2024 17:25:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUt+APFGrpGqtlhjkdmd9JNaJcJG0vazdIukIU3wejUWXC3WuA1hG9ZtJfcabqkSj+oKf532xruynpjCatkDlnJZ6C4DHtesLHZx86PQ1jN+j6geuhcxt/qmguqLFrCfqESd0wfUPfqt8+DZbdCi9LMb9RcqgWaHKUAxvrxRa1XqMXpOHsicecimw2smUAyhC+8cXhve07zCNdCkPdKLhjrAme445x0N8Bg5RZSzgpSjyDzCC5McnXkTqQBZYEHc/yIjDKoF8YZoKzvJt5ZLHPUrTXrvcrCCxSWSAZI+Y+1+8XxCY3leiXPaMBjruBROti+KwrSC5UlhhRZRo9iqy3YKc93mbrzTocHo5O+ng6PhA7795V26Y6OG4LlrF4qO9NpnuBC+i8Yxa1Ri2Oz4Qfe5Ao=
Received: from my-computer.uh.edu ([129.7.0.170])
        by smtp.googlemail.com with ESMTPSA id pc7-20020a0568701ec700b0021a89fff00esm572928oab.19.2024.02.13.17.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 17:25:27 -0800 (PST)
From: Andrew Ballance <andrewjballance@gmail.com>
To: justinstitt@google.com
Cc: andrewjballance@gmail.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	masahiroy@kernel.org,
	morbo@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	nicolas@fjasle.eu,
	skhan@linuxfoundation.org
Subject: [PATCH v3 0/1] gen_compile_commands: fix invalid escape sequence warning
Date: Tue, 13 Feb 2024 19:23:04 -0600
Message-ID: <20240214012439.879134-1-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAFhGd8pvhzehMGh1XEHBct7CGEQuF0CZeneMH3D6cKSRj5UdHQ@mail.gmail.com>
References: <CAFhGd8pvhzehMGh1XEHBct7CGEQuF0CZeneMH3D6cKSRj5UdHQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

this fixes the version in the commit. I did in fact have a vim moment.
this also uses a raw string as sugested.

thanks.

Andrew Ballance (1):
  gen_compile_commands: fix invalid escape sequence warning

 scripts/clang-tools/gen_compile_commands.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.0

