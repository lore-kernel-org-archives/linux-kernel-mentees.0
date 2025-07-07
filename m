Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2252E7F22
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  7 Jul 2025 17:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751907956; cv=none; b=mj674DjI5+8huQnlhWMosVxktgblsGwOJY5987bOsyNwHj/5NwZxb4Jafxe1+o3WMvi7Mg7EjVgyVjpTDZaj2go4aLiKQfDxHzxQnHRkAPg9RJcBOGj9RuQkFAIp+vJ68KyR+HqAJhUveFromTx+Wk7VmyLlZ7DwlWJeNWiMo/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751907956; c=relaxed/simple;
	bh=PY+mw4mTUhq/6RadpdMRqZgmrB8wZ5jm+Z1Dkpgo29Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=j7jkHLN+0SGGz8QyHLk6e3wsq3seWAqw2fQcavuCrorPVF7WZd2Q529QJKsqNkenJQ1dhO9Utd1wMN+qazgubr0eYPG1P4bcCvB9Rq2VOVKjSA+lCSy2ZXiUtypWqcu4BXl8vSy7+0PuFWXmLHzZDNQ0+Sy//Bu0oS68TJSct7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sj2vYBlO; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sj2vYBlO"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3137c2021a0so2761414a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 07 Jul 2025 10:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751907954; x=1752512754; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TpMdXzDnCfdN/GalFwfGmK2Pny6VW2Rxcn9/iXdWGFw=;
        b=Sj2vYBlORJWhmU13ceQ6fj87FHk/HSD4XdrrRN1Q+15QBwwMPx2X9NV6X2SvVVSNzT
         twaf/cDgePtVLlEhA8i4rsD4LZfNNdZFPqTPn+yLOgZ6+M5egp1tpzrD2pyHRIqWpaOT
         7F8/GWEFpJK2sX+/mVN6skQqDiOsrvBv3PGdVKAOQkH+ZNbW5CB6cXjHxUpTGQioVIoR
         XzKisIHilpsXijA2+S4ULCR9YpY0PbQAUchm7p2Yk506ePKuaQsu0+GX6o9pRh4cab8B
         iu2YkiV4XBcxcl8Mv2oD5O5/Ws0f2TRhyFv5a3ESacCYC+dfhspkWjVra0yJwq/FjWXO
         CXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751907954; x=1752512754;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TpMdXzDnCfdN/GalFwfGmK2Pny6VW2Rxcn9/iXdWGFw=;
        b=CPmsHtU/4nZKcSVxkyX/y76s7v5Th5tRwmX29EGvXvyj/OxYKmRowDxIR8Ajlu6GcQ
         Ibxvzh4pGvFPcS7fprMCgImkTGHZ3s4TVlCs6LbtPFyVbLUDyHypffYdGAjXT8Frlgt+
         b+mO/8TSECJZwOxA8tye7Ue1jXF1j5J6fFkfn1Fp0oI6UsAcTdlA/0AV3dS61ROUkb7Z
         x2kdBiMdpgzbJd4q2iPKwvKUkVTp0mjq30necGa8LettMGEOrqZTcpeyFiunDZjgNQKJ
         2dCAi6d/7gnybI40qK9As/YSa2yDo2aSBgav3qS/fnNKt63I3cZSPYqUPTv5HZTrkEOc
         To5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPd30/ARtHG+sW9sitiOhi2tHe0OxTRXSoTsGubdxGQOslJm2AdNjpZdUFBtl5ubrOaFe/5GytBk7Hrpom33Nu3DKDnQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz60QghSJzJuQ12SfLjEvbZmkk4jpufHPMSqd9xZu7VswsGKIwa
	iEjkOhH2dmhaqfHWk0evtzrarI71v8FeFpOmPMyzpyCprxMAS+axR3YI
X-Gm-Gg: ASbGnctHfUhTFFNWuLu6GUunmwZOPtzkqpG3GKFl0c9WExwzuCop0sCEfNztbDpnDTw
	RbP7E2C6BQVhJVBt9E8Qj6hof2pFUdi1PzmwASdzSOAu3AyYLk0sZF6hIYUAiLWVOZfZmUurzdb
	muuEDhasl4Qx2aEi1PsWF+LXBbZVexfL8aT8Ab6WmHdq309vXIgkyS7hObc5qGlHJoT6ga6owyr
	4Pj353TVI58H2QQLm5EFtMBO94F06JbACTnqo8tAWu/Vqb1ycAVsh8naA9D1krRMwnn11bpwcaq
	NYw95hErKtFBLq4s8Cy556AhUel+j0RUDF0F0u4eJ93uUql8aGsp07N1Ji00Qt0q9OIb8U6G+wM
	=
X-Google-Smtp-Source: AGHT+IEF5fattogvax5kob4VN55wmQfM65/bVQ74yFaRHd7Gk2rpdUBuYA2r6FYpXtk6hWnOBGZqww==
X-Received: by 2002:a17:90b:4b43:b0:312:29e:9ed5 with SMTP id 98e67ed59e1d1-31c20e59333mr265155a91.23.1751907954241;
        Mon, 07 Jul 2025 10:05:54 -0700 (PDT)
Received: from [10.0.0.86] ([122.172.85.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31a9f17bc5bsm11683652a91.48.2025.07.07.10.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 10:05:53 -0700 (PDT)
Message-ID: <c7296a36-0bdd-464d-a681-517c814afed7@gmail.com>
Date: Mon, 7 Jul 2025 22:35:44 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm: docs: Remove completed task from drm TODO list
To: Brigham Campbell <me@brighamcampbell.com>, dianders@chromium.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>
References: <20250707075659.75810-1-me@brighamcampbell.com>
 <20250707075659.75810-4-me@brighamcampbell.com>
Content-Language: en-US
From: Tejas Vipin <tejasvipin76@gmail.com>
In-Reply-To: <20250707075659.75810-4-me@brighamcampbell.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/7/25 1:26 PM, Brigham Campbell wrote:
> Remove TODO item from drm documentation to transition away from using
> mipi_dsi_*_write_seq() macros now that the work is complete.
> 
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  Documentation/gpu/todo.rst | 18 ------------------
>  1 file changed, 18 deletions(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index be8637da3fe9..76afb8a784e3 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -497,24 +497,6 @@ Contact: Douglas Anderson <dianders@chromium.org>
>  
>  Level: Intermediate
>  
> -Transition away from using mipi_dsi_*_write_seq()
> --------------------------------------------------
> -
> -The macros mipi_dsi_generic_write_seq() and mipi_dsi_dcs_write_seq() are
> -non-intuitive because, if there are errors, they return out of the *caller's*
> -function. We should move all callers to use mipi_dsi_generic_write_seq_multi()
> -and mipi_dsi_dcs_write_seq_multi() macros instead.
> -
> -Once all callers are transitioned, the macros and the functions that they call,
> -mipi_dsi_generic_write_chatty() and mipi_dsi_dcs_write_buffer_chatty(), can
> -probably be removed. Alternatively, if people feel like the _multi() variants
> -are overkill for some use cases, we could keep the mipi_dsi_*_write_seq()
> -variants but change them not to return out of the caller.
> -
> -Contact: Douglas Anderson <dianders@chromium.org>
> -
> -Level: Starter
> -
>  Remove devm_drm_put_bridge()
>  ----------------------------
>  

Personally I think there's merit in keeping this TODO around until all
the other mipi_dsi functions are transitioned as well and removed
entirely. Maybe rewording it to reflect this could be better?

-- 
Tejas Vipin
