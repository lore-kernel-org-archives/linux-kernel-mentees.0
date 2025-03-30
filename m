Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6EF1CAA9A
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 30 Mar 2025 16:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743350969; cv=none; b=RYl511qS/yIdBnHOiimIIsKDNiN2+VrBk56+X0h0FMUI0AL8dCXBL6odZCQNdWMRMcstvl+a1121Ez/uYQ4Nc3Olc5LEvgq0wYy88Dta/R59o3TE8ftwVYz/0Tra4lCiUhAFRvEidqUvCdgIsmm5mHXO5lSRzhnmh4guOYbiZPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743350969; c=relaxed/simple;
	bh=qVgSe6YnHqUBrsPeMhbV1G+0k1Gh5bSrXoGQahPQsh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cpb6r2dt8tYfCBLdYZjHHZEjrdYntVoznrt4akz/5CWThZxAE+YksKAyXMi7exKrzMxstuZZOF8bWt95n5hQrkfWNBvXswW4m4iDhDBF2/N1GOU/Vi1OrKSA5KQxZLchqKkcWxWB4Hs9YdOsJnZNU0FEGDTO/RUpRDFefPlgKEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=IR1IkIH1; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="IR1IkIH1"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6eeb7589db4so37870806d6.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 30 Mar 2025 09:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1743350966; x=1743955766; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vE4EA8v3l32V+wDYAu22J/7AGuib9xc3kzULTaZO6kk=;
        b=IR1IkIH1zGDEQptaj0JZixwv3mD7VRNDA/CykWu10APx2EYm6pr4CbhqlShjc7lIV4
         3Ufh//suBLWx3XWKAWxIk/zo7kHf1QaxYyC5Pp04b01ZMcqMtxCDwsKI5DbobNdnYbi+
         56iD/KtHMbqN72EDL/ztXs8ploVLloghEhbl+O+RVOeSTOtUVEjRMM0zWhUGhz5uAdHA
         RSvKzV0It9LyX6d4BxmZ8QqbmQ5EXE7og8RG4dCOV5q4U+zWTzpxag99ihGp62/pmv7K
         CoyOzj8MARBIeqZLEO8DgFT7PVurk6groTQHh9b0DV82gK7S2nPeckGoy7TmdDxhEAf+
         Eyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743350966; x=1743955766;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vE4EA8v3l32V+wDYAu22J/7AGuib9xc3kzULTaZO6kk=;
        b=nDIBNCghPGyghFGgeQ1mLTpk9mTd+JXV9h4mSYQHq3zeM3fKRQYoNBYI3rxHRedv5C
         hErgjpqdJta3whc9eMfDOMmyBo/aeVWKIe9NTX4B2xKyx49Ok69CjS1gG3tVlhUpA6Xq
         eu6oMKWRE7uyzeNy8H6rqDb4fVkKxThhOBjJb5b/3w6xGbKBl3GGt6Z86/ea0r2df/Qf
         43gEgcbQ4zsGMr6qq12vHmuIuIx4qrWJoeiwu5qhunCnwKxZCZ1nDRV7wIaWPK17No4O
         efncx67EIxLue+MY0culEqrjiZiRx+lPK6uKwJIs2A7iQyQmcZjQCZbPwcK6wTfhR8iW
         LMsA==
X-Forwarded-Encrypted: i=1; AJvYcCXfsH2pqW1nwLtaXLEcyi0/NmIGFvlqMyvnsSZUJy3AWBxLPkyU2xfhvmdpROTV8JXdhRBJShggMEHtWfh/5FcfQKCneg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5VV7oM/45hwIhjitj9YIeYxkbb+2LDzGiBI/eNjcvwM+PQW2h
	2FwcpUoeS1MVEMjLtQ0KNk/THyiDIPO5IHvq9PxXzV+hDJW8jUVkG1qc7ZkWVg==
X-Gm-Gg: ASbGnct6XD+vAL8B3JhTywseAhzcOcOkEc+w1s/TVCs0PCa0JtjFoT6ybgQRIVuVlnG
	W+UMm901IrvVllF9quwM9ss96rOn6DALOzUp1ogzzCzqqtaJOQ4EMhHE5E9YeAebXlt9sVNj34M
	dIjWiOGb/kqpLK1bgESHDuqgLN98JPEwmuL53DYVO763p+aui4EA01nFvHVUAsxDCSYF3ty8Fd+
	IA8xnOBfkZCW+i7XPq94GqhvsLyub6g1JKj3eejnriFkHFHOewR62gRpWBl2tGIPwY4y9YFWGqS
	C6GjcCt9D113s//KIEMQx/WgjegYReGBQhUXbcYLSWPX
X-Google-Smtp-Source: AGHT+IEaSrbr4R41o2quAG2XSwcX+jEX0eeFi8SpfsVZjT5rPtSayMjI3aEqN1OtqBBh8AGOl7JX+A==
X-Received: by 2002:a05:6214:19ca:b0:6ee:ba58:e099 with SMTP id 6a1803df08f44-6eed61dcb24mr75632696d6.15.1743350966703;
        Sun, 30 Mar 2025 09:09:26 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::df1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec9771b42sm35302086d6.88.2025.03.30.09.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 09:09:26 -0700 (PDT)
Date: Sun, 30 Mar 2025 12:09:22 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Ignacio Encinas Rubio <ignacio@iencinas.com>
Cc: lkmm@lists.linux.dev, mchehab+huawei@kernel.org, paulmck@kernel.org,
	joel@joelfernandes.org, Akira Yokosawa <akiyks@gmail.com>,
	linux-kernel-mentees@lists.linux.dev, peterz@infradead.org,
	corbet@lwn.net, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: Potential translation of LKMM docs into ReST
Message-ID: <16aa2173-afb2-4781-b1b0-a248b1f16a9f@rowland.harvard.edu>
References: <837b4d83-b91f-40d1-995a-aa3c5a925b0b@iencinas.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <837b4d83-b91f-40d1-995a-aa3c5a925b0b@iencinas.com>

On Sun, Mar 30, 2025 at 01:07:23PM +0200, Ignacio Encinas Rubio wrote:
> Hello!
> 
> There is interest [1] to get the memory model documentation into the 
> built docs. Akira pointed out that this was discussed in the past [2].
> 
> A couple of years have gone by, so I was wondering whether the decision
> to keep plain text documentation still applies. 
> 
> There is an "easy" way [3] to get the plain text documentation into the
> built docs, but I would be happy to work in a conversion into ReST if
> that's what you want :)
> 
> Ccing people involved in [2]
> 
> Thanks!
> 
> [1] https://lore.kernel.org/all/87o6y5lvvg.fsf@trenco.lwn.net/
> [2] https://lore.kernel.org/lkml/20190901133530.GL4125@linux.ibm.com/
> [3] https://lore.kernel.org/all/20220927160559.97154-7-corbet@lwn.net/

I have no great interest in seeing the memory model documentation 
translated into ReST, but you're welcome to try it and see how it comes 
out if you want.  Some of the files are likely to be easier to convert 
than others.

The only restriction I will insist on is that if the resulting ReST 
source files end up being unreadable because of all the markup they 
contain then we must keep the original plain text files too.

Alan
