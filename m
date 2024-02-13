Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3DA17FE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 13 Feb 2024 02:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707791331; cv=none; b=kOX3v/QT17zuIqWe+eTEjlmQvHLfvIUt6nPTylF2GRK2fz880BQkX2Znlv1Mbo0EAn/teopwOr0Y5JmXif1MoX8Fohi097N7mEJuJGgt2acMVu3EWJd3mplvUYUdESAu58Mr1O2YKczBUprj3OMLrusobTVyR0rhXK3f/VS5AR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707791331; c=relaxed/simple;
	bh=lS7jLHLrY8Ciy5hAj58zcA0N7SPeX/1bhP9tKSiltgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WSpS5uW/1o7Pp4MCoxpLlNQmaRdtEA7Dl+GtSr6GjOxEJB2JiORDV6iNcXHaY6ZCJqFxxGjiww8umArXM2gxSTaRt3YBVhsX6eSOqmZiTtgcjU2D46Bk39kJeZwzKhtl575Ut1gkihoOQlosFyAVl1BoNBGOlL+N+CJ9mDLbRSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFsDQYna; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFsDQYna"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1464C4067F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 13 Feb 2024 02:28:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EE3u7cnprdyU
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 13 Feb 2024 02:28:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4860:4864:20::35; helo=mail-oa1-x35.google.com; envelope-from=andrewjballance@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 658114067E
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 658114067E
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IFsDQYna
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 658114067E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 13 Feb 2024 02:28:49 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-2185739b64cso2534408fac.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 12 Feb 2024 18:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707791328; x=1708396128; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/OmXCx8g8elO8SoedySQ4pLKPgoxvCMvmMdcFHXu4s=;
        b=IFsDQYnam131fhY+jNLMjOMd6wMmEmHbPjPdgmUkRtdS8VSYszZuzDQ9dEN4UggwdJ
         l4/s9dG1hvAyVkAKV9tWSIZBZkkcXMqyMkvhJEAx4nbvaPcFqoe3Ohjr5N7g5LSDOLuk
         KReWB5qBmAwOvbr5sc2jIeFwOlOhSgNevguNRWUyiwjcz6bfZYhjlgDzd2T529UITT0t
         wltFXtFxVNaF++W034H5sijlOrwZbtGP9mLS8ALq8TF7zfKAdwlQRW58rGf539Yk6JR0
         YK7/eD0BRjkyKt/5WmenKZW25PA3Ixl9Q3fRWc1yuxvUtZ3TiMvYYEbc39U4Tlr+N/7H
         sRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707791328; x=1708396128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/OmXCx8g8elO8SoedySQ4pLKPgoxvCMvmMdcFHXu4s=;
        b=bOYpNY4dEodAT4B2WBWpa8hfu2a0F/im3a0mDbH+H1ebLtvXOo5nJS+0UQfitoVVFE
         EEk6/qAkFACoouaF0jfOmZ0p+8i9m5XDsL0IvXpqXA4hfIXK0H9J4HGqO2djRGz996yC
         rODQ3HAt06Oe+8PecmSuy5xGQU5ElBMerLxa98DOpmYJ39Pbwfkd91+ULgCcyVnY8jWH
         VgSZq79+su8a8y4CnxyU4Lf8q+rrsUiNlvBf/G2Df3jm7GvpZc+HJnG9POLtECNJEX4j
         aPDffSNcMx1CxFSZGxVcw2cwVQCtix71lFzNXwIl9Oah3WXkmIHdnY/iAAKrLxJ4ZzFW
         WF/A==
X-Gm-Message-State: AOJu0YzPBKOgM2Taztnj1U4RF/ogkiNVRNg2vle5r0netK2DpDrK9yp1
	892egq2/+Dfv77vl202BHbroSgbo6xX1uqdDIdYyVUtp2oT/3qrM
X-Google-Smtp-Source: AGHT+IFYE7I8Dz7ov5LfZYYYrsOfOjyDP4rG/WT2wczaUt7Dgw8hcpzrYmz6aIurdM+JQ9/CSsvUjg==
X-Received: by 2002:a05:6871:29e:b0:219:92b2:d2cf with SMTP id i30-20020a056871029e00b0021992b2d2cfmr10616708oae.27.1707791328369;
        Mon, 12 Feb 2024 18:28:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV5Y0UHdG6DgUZwiOuH/Mdr3BAT4veNANsUUPQjuqvFL+K8mT+mGuzm6hZA1vBJ9qfWluwPSx6wZORKT9+4/9mdoZnmvScFYsocx+msYPh2yBq/VS8/JhtZnHC1GMGSLoD+Lu8sKjudVeNVZ50GwVZLQV2MWzhUhHyN/eFEe0us562vuywl5GTgR3V0/jGsn7Tax6wAyGtlLsK26HOAp83q1wfDW8dGu3KLL+OY8XLhPIUJZyJi/zlQ6/uR0VdXJabCNCJzz0mR09KFFAXrHfuzFxvF7vUa9IOGF+l9kd0jRXnJZMD63iyI7j7YV22Dcl9GCxYGTK/9wd2njqdB6hfWFK58gA0jtbP0PmUfk5CHSdbLjhKqcyjxStNnSZUmA73YhK/sOUwH/2g1VLrRLdAugJApLg==
Received: from my-computer.uh.edu ([129.7.0.170])
        by smtp.googlemail.com with ESMTPSA id z9-20020a056870514900b002198ca39e99sm1659648oak.17.2024.02.12.18.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 18:28:48 -0800 (PST)
From: Andrew Ballance <andrewjballance@gmail.com>
To: masahiroy@kernel.org
Cc: andrewjballance@gmail.com,
	justinstitt@google.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	morbo@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	nicolas@fjasle.eu,
	skhan@linuxfoundation.org
Subject: [PATCH v2] gen_compile_commands: fix invalid escape sequence warning
Date: Mon, 12 Feb 2024 20:25:52 -0600
Message-ID: <20240213022552.754830-1-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAK7LNARaW1V5X79BFW5_YTKY+n+OSp+_ACpRxpiw+VOJ+2hf=g@mail.gmail.com>
References: <CAK7LNARaW1V5X79BFW5_YTKY+n+OSp+_ACpRxpiw+VOJ+2hf=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

with python 12.1 '\#' results in this warning
    SyntaxWarning: invalid escape sequence '\#'

Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 scripts/clang-tools/gen_compile_commands.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
index 5dea4479240b..93f64095fda9 100755
--- a/scripts/clang-tools/gen_compile_commands.py
+++ b/scripts/clang-tools/gen_compile_commands.py
@@ -170,7 +170,7 @@ def process_line(root_directory, command_prefix, file_path):
     # escape the pound sign '#', either as '\#' or '$(pound)' (depending on the
     # kernel version). The compile_commands.json file is not interepreted
     # by Make, so this code replaces the escaped version with '#'.
-    prefix = command_prefix.replace('\#', '#').replace('$(pound)', '#')
+    prefix = command_prefix.replace('\\#', '#').replace('$(pound)', '#')
 
     # Return the canonical path, eliminating any symbolic links encountered in the path.
     abs_path = os.path.realpath(os.path.join(root_directory, file_path))
-- 
2.43.0

