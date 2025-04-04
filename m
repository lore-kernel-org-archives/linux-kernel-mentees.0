Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8798D18BC3D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 08:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743755121; cv=none; b=IgGWn+rJP99EA1iMCh+ui+zMTr5Il/8rasrB3AcoZ7DLjeRWqmTrMCIVfZf6gXy8jpJveTBJub8roWplVzxI5jvRHex/rq4aALgLCPKbTeT3HNaMJNDFKil5RtJyP5nQPAsG2yY7T/ZL3ZypFURz652AVnc+1hfDGKChg9Gh220=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743755121; c=relaxed/simple;
	bh=ki2U4QAPiVrOPCNE0sc9O7MbbgjVfkGGaNGHNTMHOsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1NmxzNUZPOXCLkdw4AJycm8otdqXQ7x6lI+joWJsP3Ks6zjWUaSAmUyyePXpStXYjIZyWE+WFTHmdkL3xyqtghHmYVOOObaG9wOCUELss+WBRGHwjPa6IxDFDmDOrwtXDcPcnkx3+02weAkZofItefggTam2sws4RDYiB/gL60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wcag+kBd; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wcag+kBd"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E4CC400B9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 08:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KTbtrfqXelJF for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Apr 2025 08:25:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=x0rw3ll@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5E4744031A
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E4744031A
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Wcag+kBd
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5E4744031A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 08:25:19 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso3297280a12.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 04 Apr 2025 01:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743755117; x=1744359917; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zryx7ad32NdBny1P05+MPUD/OPYaqir+9vR64JjAn9M=;
        b=Wcag+kBdPfERBeK1HfrwZUDNF0h15N02ilu80FEA8nzx9Gf1jXeJ9dOVE4C0tifkv8
         k6zDDQp9gSiMSwNTi82KTy9chlEO1gHw9qfcGn9/mmAbp+l9ukzuuCSFhjByhXwRkbEU
         xaVl4/jfOnbaNciOlVlf+Ui1Xt53TNkaIDuvd67NTkmDgCyrjnLUTQTMjnLI3FeTekkX
         KX4oF57G6sHoNt6yKMEggJP9M6rCke+QlURqs2I5mYbh4bYnk8ZXLAkjQChGG0Ir9KTs
         zlKsfUmAAG8QdXzlsjNvfyfb6+IJtCfEzOUhwv+N2i9JgZqAKfCbiV0DE0jSdUHa94BM
         Nj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743755117; x=1744359917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zryx7ad32NdBny1P05+MPUD/OPYaqir+9vR64JjAn9M=;
        b=lZDp2IyjS5Ad/Oxim0jl1iAaUkKo3iwbdl9bUvl/Av5cySvTw5EaPwJzGElgn0hyM8
         twaykcy9hPsNFknWPnYnb5msjeN57g5nN+CKu3iqWsv/n77cJAI6wgm93j5hDbej6vIs
         c4RpL6KQKwCsZATONX9fVvQx1vpQN9D8AIkJrh4c9AMC0YSbNPRyC8pXA0QeHhrfS76x
         pS8wB4Nyz+IV6wqqhsElpk1opx+3x0ZcY0Od8bDoz0ZJ6PGLhDu+LvqNdGjWA2CJxmmC
         IuZ5vFK7631TIrwFoEWVsJEVX3qc8zMjwerYOmiOuk/oW9XqDoDniG4xreH1OAhL4y9j
         GHiw==
X-Forwarded-Encrypted: i=1; AJvYcCU+tDl5uG9mGBqvNaxtaRDzMftuoVRoCnGS8vf4H4dzyRbmw6PBrD4mnn2a0nJ6w2WgbfQ+TM9Tk70I/OZaT6Oyhz663A==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yxr1E0gogtjE18jyHovAIe/m2LHFpl8gbFti7r4GVuqxE1v3vPK
	obBELrX+IL2jizL7CxXf4AZR51XTLP++cEb/S5W1M4cPVc2Ww9iI
X-Gm-Gg: ASbGncvazmHZr6jElGZiRBYgIejzhhRl2X38SQr8NDBrScPMAOBPCGZqOibuVFYzcJE
	Oj0Wq8ghqShZpYloYH8ywfZY5I9LVS8urk6FxeMAwxYSeFs0u1nOu9ltc9+mlWgWfukxiHhxgGz
	GFCS+/mHTGdU0xK0teanMQscC2AnCYpDYrB5q8jg8oJNByGrOsOhSPB0CUJ8AU635B7pCn4M/IN
	xQwXC+mpjcX+T+R0bNHSeQXSzPks0Knw0hxdKZwvjT73JV51R7MfkNN2LPo2J/ahF1aqVU9YL5V
	QltAcUuRq/OGQDQt1JEghZEmOQSAa2xIzA==
X-Google-Smtp-Source: AGHT+IEYtKEnGZ39GvMbcfj0wNEB/Y7HPIe4XJ9Z3n5OVfb4/JVz12XWbpPUjW0OK75Bv0H17r1gBQ==
X-Received: by 2002:a17:907:8688:b0:ac3:c59a:413e with SMTP id a640c23a62f3a-ac7d6ec546dmr163533466b.55.1743755117074;
        Fri, 04 Apr 2025 01:25:17 -0700 (PDT)
Received: from localhost ([95.85.21.12])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac7bfe67e17sm216029466b.34.2025.04.04.01.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 01:25:16 -0700 (PDT)
Date: Fri, 4 Apr 2025 10:25:14 +0200
From: Ahmed Salem <x0rw3ll@gmail.com>
To: robert.moore@intel.com, rafael.j.wysocki@intel.com, lenb@kernel.org
Cc: skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ACPI: PRM: apply ACPI_NONSTRING annotation
Message-ID: <00f4b71ec859adedb34bb33b05634cc1ae97cfda.1743754416.git.x0rw3ll@gmail.com>
References: <cover.1743754416.git.x0rw3ll@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1743754416.git.x0rw3ll@gmail.com>

Mark ACPI_COPY_NAMESEG() destination char array with the ACPI_NONSTRING
annotation. prm_content_buffer->signature[ACPI_NAMESEG_SIZE] is 4 bytes
long and not expected to include a NUL terminating character.

Signed-off-by: Ahmed Salem <x0rw3ll@gmail.com>

diff --git a/drivers/acpi/prmt.c b/drivers/acpi/prmt.c
index e549914a636c..7c2553696dd1 100644
--- a/drivers/acpi/prmt.c
+++ b/drivers/acpi/prmt.c
@@ -40,7 +40,7 @@ struct prm_buffer {
 };
 
 struct prm_context_buffer {
-	char signature[ACPI_NAMESEG_SIZE];
+	char signature[ACPI_NAMESEG_SIZE] ACPI_NONSTRING;
 	u16 revision;
 	u16 reserved;
 	guid_t identifier;
-- 
2.47.2

