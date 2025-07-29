Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD1B1E492
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 14:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753800318; cv=none; b=tK6GAC8tbFlHExlK698VoynoFoS8IFw7ri8Gn3+E8PqgKvW18PSCHUTCpc05KKN8dF7mJmU0zww+ieMBApkszWiQsAvslbZA2B4IZ3Nop7L47pXYZeeUmZKDyJVw/BdPkQSYlgxE6GNbuut2mzDCRIxaGjB7+3dVnObv83Wpl2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753800318; c=relaxed/simple;
	bh=SqKSXMyKE1pb1btB4u4HtX000tSuP3Xq7jg/MY0Ben8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EB17ffj/tW8k14492sNY+iM/ICt+/MtP9uIYImWPH5E8csvR6oiD9WHAeoAjdQlT420uvZK68gRUze7QaL268tddVWn1K5K8EivvQoVRSo7dXjbBJrozEXmNwdR5C95dCJOw+O/lOs9+JyejXEKPrVbDERUcla2GC/HxMTjxj00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLpcCfHx; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLpcCfHx"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-61922872dbdso1464727eaf.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 07:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753800315; x=1754405115; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqKSXMyKE1pb1btB4u4HtX000tSuP3Xq7jg/MY0Ben8=;
        b=JLpcCfHxwJ6+IrmXgLSFmL15vtEpuWq0bUgZsi7+YAf5agtPkuDeeOREUxJL9m5Jvw
         KDAD7LLDPFn8BQElHpKUAEVU8x5sZnqiHkfb4BHXqRmkXipKbkXww6Asa6UTpVcxSqi6
         ZSKcagmHzieYbVtLMR2CTPXYsOZl2NVZ0hk9C16VVeere7OBQH+jvTDriaCmEFlcR9aX
         rosZmB1MsuikK9aHNx0JLTbmgXXpV6mgiC5sfWZXcXO85KtG1/PiqpcMsGfeU8GrASwb
         8gtvgdj+MLuhiaP75SpL5zB3ycbMLi7kGsAnPjHHYQdt7JXbQBQ7dzSzyH9M/fN5FKri
         tpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753800315; x=1754405115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SqKSXMyKE1pb1btB4u4HtX000tSuP3Xq7jg/MY0Ben8=;
        b=f2NEdNDsA/qYRsyYeG3plxb38MoHVUm0mZ507j31n/F3ditd0FeKMoGnJQzsYkspu5
         ZQx7qSL483LUmucte4YpzS5r5FVJ/iTQZpEjtVgr/w/S9izL+CLG6VMNG9Hjc0S4Ugbo
         ThLEcTQcgpDN8+DrCZGDocJuG8IPmNSNV2NcW934p/699DLnh/AUSZrZuwXlduQzt4oS
         QqAv9JQkfD2tapU1NSJD9iK1LIxesHjh16gWDuwxFqCOY5Srz2ctJHBv+rcJgZLa1DzK
         a/ZfovcQO1hCLcRsg6AxGFJuM/aKLi0H8xY2HaUaCCaTe5eBDbEjfhaEG+40p0bpXakV
         oL/w==
X-Gm-Message-State: AOJu0YxQWdHOSeWgYcTkz+SzwTBpiwymRTqtT9IPm1X/vYv7J6l8VIJp
	57jEd1xGHiSce9AVMOAUdU2eSoXrzANEDhjl2A+2HYgL0mVq2KvBOkwOQE87PzRPZOnp1+fwf0y
	0Vio6H7+way1kX/1Ga6PKErq5Cd/7HM0=
X-Gm-Gg: ASbGncvWcI3qN2uEXY+wBt3vkfmyMBq8+biLmBJVLAj8s+BmivklKwhCV7eVyp/4qf0
	emKSYhaZ79D5jBRHWT0F9gNbwIN1P9odPuxbvFpgEIbUOSqqKyolU22tIAoECfRBMkGzSbU9ysl
	iBZYzX3L1xGOUC1CHLCIXg4ptMFGFA97xjr5zV5w/ju8VvuVF1HeRYuaqZxoIpQqVBFVsT6hRSp
	71YVoGR
X-Google-Smtp-Source: AGHT+IFHmgLm4QtA1gMM68QZkXVDwXCrzQje62zufxoahmmzdI/oX1Oj1iWO1COkXuVtE5Extl2/Y5qlaKrXIMvaQ4M=
X-Received: by 2002:a4a:e906:0:b0:611:ffa0:3863 with SMTP id
 006d021491bc7-6195d29252cmr38156eaf.3.1753800315371; Tue, 29 Jul 2025
 07:45:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250727125044.101779-1-suchitkarunakaran@gmail.com> <079be718-ae8f-408d-a789-05f4816e0bd4@web.de>
In-Reply-To: <079be718-ae8f-408d-a789-05f4816e0bd4@web.de>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Tue, 29 Jul 2025 20:15:03 +0530
X-Gm-Features: Ac12FXxxh7hpT3FnQiBPNFL1EGOADL2JW_Lh4kOSk8OhVExH7PpSacHx4mz2er0
Message-ID: <CAO9wTFiQdHA3JjXAbmXdxmeUHehVY+43+zg4BiYBxY7coSi+Ng@mail.gmail.com>
Subject: Re: [PATCH v2] checkpatch: suppress strscpy warnings for userspace tools
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-kernel-mentees@lists.linux.dev, Andy Whitcroft <apw@canonical.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Joe Perches <joe@perches.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 29 Jul 2025 at 20:12, Markus Elfring <Markus.Elfring@web.de> wrote:
>
> =E2=80=A6
> > This patch suppresses =E2=80=A6
>
> See also:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?h=3Dv6.16#n94
>

Thanks for the suggestion. Will keep this in mind next time.
