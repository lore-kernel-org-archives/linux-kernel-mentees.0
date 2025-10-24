Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD4B224FA
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 24 Oct 2025 05:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761283924; cv=none; b=FjhxfEBk/uCXEXCmSz/Zjq7TyFixlEqHclhtKV4JOGS84rCeAgp2pSl8GsOx+9WH8pekawZvKUz/gmlDjesxdWKH963dz6TXrbb1pCB8KHpe3C70pmQrAbfycGOEA/wPzw7SjgVQUvChWhjcsu628HJxYflvQnoP81tgSQKYl9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761283924; c=relaxed/simple;
	bh=jrZFDTVAnVgZ12PpGzZA6oTE8Uvz8Wa0TIbGoyoIcmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FYVJBB3uUa1qZc2w7Z8iT4aA5p0RxxXkGVEKNq6ajIzB1An5mhit1eBvrTxBUOu3MNseq9cY6cXeUWsVIUXDTfqXYVj1W6DveP0bhvJPvVOlNX+xZe2rrHjJPPPILBW/TUElzgPIL5OxCU3cNTW3wU9DLhBjJT9kJqIx8quwcFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OHvX4Cp8; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHvX4Cp8"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-63e076e24f2so3363065a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 23 Oct 2025 22:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761283921; x=1761888721; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jrZFDTVAnVgZ12PpGzZA6oTE8Uvz8Wa0TIbGoyoIcmo=;
        b=OHvX4Cp8wGXYGmVN5Y2iPwES9N0R/aT10ReXHLluwK9KAEhOKREaRX8Whwsl7w2WNS
         EK+ii/eIvJmEgc/ZlHZcwqeAEBKnzT7jgdDYBXsmGToY5wpAI37KQtqcwhKiWQjLgadl
         9slzthxDysx4XF5d8X5+NjikhYU6MsRllog5sn1i7AjHOtCZ16xa5WFapgY0dBqagkeR
         vV0LvUyYiXMKGVmhhV5T4BV74zf+XKjJnh72wf6niUvJM5tW0eGSBaPxDFzRlVboYxB5
         B7msKmlsNo3DfuKU/a77U6haaTwbQxfFhXRu/RGiH4bgP8YhEOpGL4jgSv9/MSyhbbHP
         fOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761283921; x=1761888721;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jrZFDTVAnVgZ12PpGzZA6oTE8Uvz8Wa0TIbGoyoIcmo=;
        b=o9IZxpgO83RtzhLIVXUpYYvecur2tUh7ZKyYaW4Fg72vZkndAnnIfAJDxIXqFE4zMa
         m7lUQS52AbiV6TuOh5tvVwHntnKUF5CoVr4B7+z3jVBt4sWVE0WUfvp3WSUtGGL4oSo2
         mqBt4dj9LERN1Q7ZsTDsQ6KBz6LCb4/Mn1Hg5GbGaV48GKu3BCmQ47bV65OHgfhBD/Ot
         yd7mnHRLfY6xcVtZyB63NmhHyGw11Z/Df0XpIFjbuPpYOx6f7RSsOWpinvSvjz6HRREx
         yWJ7U8vJ4nO7yQOkysvz2m6hxHnN/u2vEVQaATvbUM6erqBv8aLmEWesCO1mqQ7ofoPf
         32uA==
X-Forwarded-Encrypted: i=1; AJvYcCWW3PJgDUWD6Zfl/CToh4+BqUNM49xSiXiC8UXb57ZmaQGqD5WJg7OyfkOUeJdj2V0Kcs3iez5dWBEoO1D7EDzuaxuFPA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzdM1KN03vDDe6sCDC+t1FjKIIiDCtWW9M7ngm+wN5fVkBPDweg
	/7D3gcVz1tIVFzgAo5mWrJjtwccwQ7gBPpIgz171Ft0lBoS52yOcF7Y6B8Dv9fnjLms463s2s9a
	4Fd2pNFJ19PvqeyGxNLwpAy3zcXi+SWk=
X-Gm-Gg: ASbGncuZ3fR5UfvUr8SnG9phAIYfAZ66kk7f9VDExkGENvJqVGaPBR4eHix2Y7FtbmS
	e9cdd/lS4GyBZgdAYyECWUBOuYgQ17FPzymkHDtTw0guZnlLca3KPoWEJLUStby45mVSPpLsnUg
	Ba8nEqE21s/XeqH8YhmJPf83M9Y5k7KRtI8/qF7DLt3lMzEO5De2zCrx039OfpOvgVuBtVmRYLd
	5GBPkKDRuozVtifmWYYHfXJHDoo6OyY5/e6cIcKNK6f8thc2+W+VQ/Pzc/S3mdTSb+e6Bz2tEHx
	6qJfehiUK8IhAuWku3P3/6tUBfkCDv6iZj87nZdgCg==
X-Google-Smtp-Source: AGHT+IGFabAhZAJYuPfr/6rC/PYhEDpQyVDuFdX5CgymYZMIeCEsElgNay6QkpiOoSX+UbWLt45lbDkjDPoIV9KaDOI=
X-Received: by 2002:a05:6402:2787:b0:63b:d7f0:d940 with SMTP id
 4fb4d7f45d1cf-63c1f6300fbmr24095995a12.1.1761283920553; Thu, 23 Oct 2025
 22:32:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251020134857.5820-1-viswanathiyyappan@gmail.com> <417c677f-268a-4163-b07e-deea8f9b9b40@intel.com>
In-Reply-To: <417c677f-268a-4163-b07e-deea8f9b9b40@intel.com>
From: I Viswanath <viswanathiyyappan@gmail.com>
Date: Fri, 24 Oct 2025 11:01:48 +0530
X-Gm-Features: AS18NWDs_5xaC29vC8E21DedXs-dJA_wBfE3U9f9TDVAjvKKLnU69pQirhtU_eY
Message-ID: <CAPrAcgOimjOR9T5K07qR4A8Caozq5zimD23Nz4G2R9H_agPgWQ@mail.gmail.com>
Subject: Re: [RFC net-next PATCH 0/2] net: Split ndo_set_rx_mode into snapshot
 and deferred write
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, sdf@fomichev.me, kuniyu@google.com, 
	ahmed.zaki@intel.com, aleksander.lobakin@intel.com, andrew+netdev@lunn.ch, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	david.hunter.linux@gmail.com, khalid@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Oct 2025 at 05:16, Jacob Keller <jacob.e.keller@intel.com> wrote:
>
> Is there any mechanism to make this guarantee either implemented or at
> least verified by the core? If not that, what about some sort of way to
> lint driver code and make sure its correct?

From my observations, The sane drivers modify rx_config related
registers either through the set_rx_mode function or the unlocked
version (prefixed with __)
I am not sure how to convert this to a validation of that kind.

Basically the end result should be that warnings are generated when
those functions are called
normally but not when they are called through ops->set_rx_mode.
Coccinelle might be able to do
something like this.

Related to this, I don't think a sed would be sufficient as there
might be (in theory) cases where
the function has to do a "synchronous" rx write (flush the work queue)
for correctness
but it should be good enough for most cases.

I am also not sure what is to be done if the scheduled function just
never executes.
