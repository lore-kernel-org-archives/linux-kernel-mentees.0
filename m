Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AD113B58B
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 29 Oct 2025 04:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761713299; cv=none; b=eHEp3WdWOaA0vep7JBscttCMgNTmswY2icif0B2QC/pOS88nbvdaL8/pELdDSxEdJLxrKfuNfni7AQ0czjWt5R/vXcUDjyMAiXlXzn8w47ldzx+rSW6dl9BlgbyIU+ouDOmnvSEdJAnUR9RBORvFN0oldxIPu53t9fl/oUcU+8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761713299; c=relaxed/simple;
	bh=kHz9dCjzGPr/TBnbHcUyEuqYu5rhLLgZPHHmF3a5zR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+9f2AFAc5nx/jWW1Jh0sAs1L5XU/46wtL7Sc94hF+STQK3XrPgn6bRWL2QVygTbu/YUFDTdPgLWYut0bPaHA3ijCiJBY37yjVL7j0iyXis+PbGOE8+3YnBgezGqUGgJxKQt303Xe5gat+EEbL0WySfIyd4ggEka58j5+skeJDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZD1Bumdi; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZD1Bumdi"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-63d6ee383bdso14520735a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 28 Oct 2025 21:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761713296; x=1762318096; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dbq9nt56FgGYWix4HcpRFcizCDr6bw5OvUlM+bYyv48=;
        b=ZD1Bumdis8/x4R4/6FpT+Ua2GDTptcjiF9frprOfYNXsKl/Fr3zEIhRyNzAVzyO6qR
         PBumluBe1QcBCptPZ/pQvyekDWLRMl8c4lUTvmi/Ev3gMuP17peOCcPfy3YdgkLfM8JC
         RLkeDl1AufbZI9AlbKAwkQYDfhDBW5A4VIJM1IoNVcNe1f3jleREweCgA1L4e9EG6Pzj
         bthgYronED12OKRUBpUT/PGzdbk4VODMlnXMC9DwXr1a0yGuqxLAEb8FVBjDh6QbJuqM
         lo+5CDfC9qxmTG4O+G8LMKeQn+DBBNqy/2XZiTm+t51V+NZyhm3PaPFrAuOcAuyR0YOn
         N73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761713296; x=1762318096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dbq9nt56FgGYWix4HcpRFcizCDr6bw5OvUlM+bYyv48=;
        b=Bt5YrUqke1mqAxcj5QE1SgnJ9eNVAP8wAY/NQGqYjHEl3vkQlnLIgtlKmN8ZTFJ1JI
         TBEipQ53uyIFByIDjaGlXbajRdgIWANLQHA3XAoQxOkUG5ZDh0BDTOuYSVSQMLG4TPso
         4T6E8ZtXXpWXrz8pI7OPwQ9BoGoISS0vUZ/aC+MGv/rn1W5sO73y8EMsU7hdx5dQN3P8
         vIe9JopQ48Giaxc/JsRj4+bh5YB+sWn3mbs6P/EyS98mByAfieCiGDz2sWcqaF3Vny5V
         CQWGWdXPoE6LXnvhuBE4dPG8/hkSWMw00YDTV7EfZL9O+Y2khiyQZdXe4LIK970n7KWw
         880A==
X-Forwarded-Encrypted: i=1; AJvYcCU4OnGAjePVtTyzzml3wRPv2NI0v3Xfwu34OFUqUmnke3JURFz+bJanzZ37WZQ274KBkuWnZHGtW3oeyX+U3x+x3pv1aQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJ8ks4FlAw9BH7+wfGeeUjP2kZyjO6NNB6UA+nr7/TwB/bqvYn
	a953DFrSy6BJOUx+oZkjcIkCiBIlAIf+uD91Hgf4pA+fvDeGQsVC+GmKwlr0LjSwGcZ7q/OMfJ2
	eDqHT0f2J44+0v6TQr6CrHRwJYlUQAdw=
X-Gm-Gg: ASbGnct9RzNG6dg/Cf06Vhhlg0xI4P+YSaDaIMzcna3MIeGUyUzH4qgXKSnZS0AmAgA
	mZKy0M0Zcg0j2JtnrHr0nbWm3iefLP0TwwHEvCrcrWcX5aepNiQhKe4fHKvnKTz0gueo85+9UR2
	6vBD7UMyrNWyNGT4H1P57mN2b5TDZJAYQSotDowlQBA4002vf5sbr3jDx3ClWTekEZ+fm5heB6K
	nBFHa9dXmkzGN3AJGhsrpUJDG7ubV2LC7L8ILGtr9asaFpOYa00K5YB+IXYkXrCdgnOKs0jDgrY
	AGGRgWgNCbZOBWf4s0Q+4/iGZ1ANxmJXUquiP71kfw==
X-Google-Smtp-Source: AGHT+IG/Y3CfWbdVX41gQBZzCyhI7Mz/jKAEDyoSdZ9xeIABB9XbwtrOeNPc5GqcWolvq+reBSqHpgCJ1sBQNXdIxSM=
X-Received: by 2002:a17:906:8a54:b0:b70:4757:eaf0 with SMTP id
 a640c23a62f3a-b704758054amr7191366b.44.1761713296230; Tue, 28 Oct 2025
 21:48:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251028174222.1739954-1-viswanathiyyappan@gmail.com>
In-Reply-To: <20251028174222.1739954-1-viswanathiyyappan@gmail.com>
From: I Viswanath <viswanathiyyappan@gmail.com>
Date: Wed, 29 Oct 2025 10:18:04 +0530
X-Gm-Features: AWmQ_bnX6Xg8VY3oeRVLdkgI_IKLI94gd2JcIj2LeqnuQY3vbZpxM7rRQ_Ai5L4
Message-ID: <CAPrAcgMPFnypR_zczpCbrxN3h9grBrS1WhH6u1bJfO+H0UjGWQ@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH net-next v3 0/2] net: Split ndo_set_rx_mode into
 snapshot and deferred write
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, sdf@fomichev.me, kuniyu@google.com, 
	ahmed.zaki@intel.com, aleksander.lobakin@intel.com, jacob.e.keller@intel.com, 
	andrew+netdev@lunn.ch
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	david.hunter.linux@gmail.com, khalid@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,
     I forgot to cc you on the original patch. Here's the link:
https://lore.kernel.org/netdev/20251028174222.1739954-1-viswanathiyyappan@gmail.com/

Thanks,
Viswanath
