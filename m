Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE26635
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 31 Aug 2025 22:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756679198; cv=none; b=rgLF1gI6LNrIui5VoUv0vjrbfUrHdwghJik9f/Lya0hQMRbRs/tsTnovsAdJOxKQTCxgtNFu6gHcLyyCikFXb7ZAYXzw25DQvfxhIUK+SXmlHKxcxkHuTqhWBSgPk7cHXcObDxGzeVi2IYgOTO/mmz+dSVA0DEvTNbMwRLkZ598=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756679198; c=relaxed/simple;
	bh=jHJ87rT/K0fRtIQnkiu+1QCxD9q2bGvnKc9qDFuLV2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NCo2BTMxYGe4fb4/d7VoQGH0Y7yBWPJL/P5ppr97kKW9of9zZ3X+lzrsJS4iHQCOzn7Y1m1NH0X2YLtchJBcCSYqfXnNQG13ZzVjzrlg1W7UHEGmuj1V7iTv7UQI4jHSSe4Y52iciQmC1m8Zq2L2AaEsUob2jJV1w75d7PmhJpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTXMCxAX; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTXMCxAX"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-24a1274cfb1so7266185ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 31 Aug 2025 15:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756679196; x=1757283996; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GkOTG4s16xJPpIPPmhmVIyLPlxZ5TYnLEhb6pSlX98g=;
        b=JTXMCxAX6Z9Qf/Ut2ZftwRTlhg5mjai/cJlkirBvE+XsT6zTPwBJqRDQWzgXOvxWv0
         wwDxHgq7YkC9sokmS3dBlzgOKLlUZdlx8MNvVMpH+ymfkrwPzUzEUz6Vgg0yoSuZQRLB
         +UeRcEY8oLSfinkxEoSo8SUM4WaB/qC1hXw5dob4s8KwjcRL+8RO3BuSbFCeVh0z5QxO
         SqbW3AzAv+qKIW9+6VFr9lei7V4NsOiqH6B9i9CdyATf25JgfzFlC692TbxcuoZc8jAb
         jvtm6tyF973gyWAUIsCHV7axVMPQfgGVhOGeVkGhQASdxRXiJEcvH0P//PtDTviqXsh6
         m3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756679196; x=1757283996;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GkOTG4s16xJPpIPPmhmVIyLPlxZ5TYnLEhb6pSlX98g=;
        b=OWctWdmY2Q3rgSzqtTq9t/DFp4gQEvVNvdmX5ve6O7WwtJ6PSl8i3WCR/3FLyHWOGm
         uL3POnHVth9PsctVTgMYsj906oiVGSEPXrJjjYq3ydLj08HYx0uElaaycOFCin5PKW9V
         JZ1CBFZZXiD5tR/f/+brpB9M/VezFcgGAEJwfLSi2p/pEyWgKkrlgBmMwHXdNCEMjDM/
         tXMoAsctTIHGQhyJj1PTdL12bVQXcDqHE0nsG3VsEeMuslTsAzw53NfvnmUc5GoFguwV
         67IAk9XIznYK+1lxheBrHMsr62dRoIAPW9RSqVbSumttJao2i8iD9z4+6u93tyctEozW
         zGBA==
X-Forwarded-Encrypted: i=1; AJvYcCXofN9MX+d37M/lAa62Y9vNd/Bn1nXL3Ks3a0lbfeM1bGb16VV132wUzQKYFJAtJBFXhF/SiwI6sH67lkiFgPYLRzZkLg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQAItsN34X4cliQaOsgfAGrVaBX2tHbU/G9w6RlKv+24wH4YRe
	qZnuhVCbzegr+6KxiLnPw/SrLnyh+kJ3vOMXcRkCtK41F6WiZHxHQlXa
X-Gm-Gg: ASbGncvcRlVBtQqAS/LO58Qdf6XAlTDzbGIamBWRBIK1fW3+ILS5L9sZroRh5Aud6Hk
	ububdeN7wxiOrx5ObIXqh9iJ1TMiqsrehJhxNIIzfBzM5Ui+7EmFT4sbARNo8SookF7doLtWJ16
	hRYNVhCJBzX2fz7w+L3X4AdgnFyKPbJCgNgTjTl9J5d89u98FNAC2DFWk5APjN0/WROcsdHVUI9
	Zzw9SCCkh5vCAmv0uvbw2SPagM7+Nng+ZL8lAb6UvjQu9vbkqqVmOtmgIewnkN8Jk2wq9fdvhU8
	8djA4APCQ9V5iEesN07jLso42EzlI4vDNpmAW/AUHS85zs13V+wd4LXtnBcd0ktxOxdSr6R62Ha
	TlBCIJ2fD0Vk7SbgdG60HTUNWjL8dcWorJ/bCQJGFX1lFHA==
X-Google-Smtp-Source: AGHT+IFB20ujAd1iyUzwccwOu3+efPsEQtlvmofLVgAAn33qE6c5pHJ5x9OfqYjgPE8cvzKvXd4AVg==
X-Received: by 2002:a17:903:41c2:b0:248:84cd:49e5 with SMTP id d9443c01a7336-24944aa23ebmr90806475ad.31.1756679196310;
        Sun, 31 Aug 2025 15:26:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249066dcb44sm83043845ad.138.2025.08.31.15.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 15:26:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 31 Aug 2025 15:26:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Debanil Chowdhury <kerneldev@debanilchowdhury.com>
Cc: ninad@linux.ibm.com, corbet@lwn.net, jdelvare@suse.com,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v4] hwmon: crps: Fix typos in crps.rst documentation
Message-ID: <82a7d835-e90f-4bf5-9a97-42009b2da633@roeck-us.net>
References: <20250831045710.6009-1-kerneldev@debanilchowdhury.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250831045710.6009-1-kerneldev@debanilchowdhury.com>

On Sun, Aug 31, 2025 at 04:45:54AM +0000, Debanil Chowdhury wrote:
> Changed a misspelling in crps.rst documentation:
> "Critial" → "Critical".
> 
> Found using codespell tool.
> 
> Signed-off-by: Debanil Chowdhury <kerneldev@debanilchowdhury.com>

Applied.

Guenter
