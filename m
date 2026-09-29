Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4250E3A901D
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Sep 2026 16:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790698090; cv=none; b=uTFOeYe13vRb/rIEJMD6DuI+Zhtrq7vZ6X28+WxJNOq4TpdjzJm2OURzGmBn7CGZrDpUTrkjfwSG0yz9BOOSVpl+atIVYIs5/mYqMQcV6V1sBsR8w5BzDskgwmceSiibCOy1TjA0FErsT2fk0tBUVrfH6KWlZfoJrpRSatj54FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790698090; c=relaxed/simple;
	bh=6PNZA3OWGUBccfJboMFkKmGGHfbWFVnO81DrwaEZa0c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BUqOdC1zbN8uugQ+aVPMkY+sJFqoXX57qRKRZlN1ZQJ3Kd3la+SB74m1945HtWrieX/g3BRQM1zRpzeW/Cg+nbo8Xota8cTSpR2LFXmM9UtwYaYVEnXbgKfDDwUX1DbS6SUyRMSDCqUF14gnoEpCZnHIyc0hXeEQh15R39uZ9bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWOh4e1W; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWOh4e1W"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-530d0d5ae11so51126181cf.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Sep 2026 09:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790698088; x=1791302888; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6PNZA3OWGUBccfJboMFkKmGGHfbWFVnO81DrwaEZa0c=;
        b=DWOh4e1WhbR0nZda1WopwY2OSsU25pP7viA102vy7M43wYVFPadLvwf6K2DFiVxZCt
         8mbI+CicO4xpMIgPyFlNvQc/+aYJBLCtLzBlrfubAqI/PIe86xf7ua3FWXlWXxGiu5C4
         8CUtKzwwSjsCzMGc+K7kffjpA6AxxcWOS3jp46QKhGuOHRmXgZbYi5qyoE90P/+Xxn2m
         FfgyKW7qmWikv6JGIECG8t5MPrlt8Jur/lKqm6aA8jIGx+0h6vHc1qgg/FYKC0nCABjB
         D3Q7EJ/vYGqnmNTsw34ZN/AK4VU+yQ5wKV8nZ/+kHQCiCyXfSFBRZbJmLnTBq2K9LcRE
         xwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790698088; x=1791302888;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6PNZA3OWGUBccfJboMFkKmGGHfbWFVnO81DrwaEZa0c=;
        b=swWurLc9Q7ZsAVsnnEbJ4MCEHIF2Sjk99LFoTZR2T7JjG6cErLfwe0/eZDEclLn+hP
         EyJJUSh8Bd0N5eYSfaJAYdItp2oon+EVwA04psKhyuqnoQj58bPH6NBzQQnTgbTsi0u0
         w+Y+3QTU3eEZ9N6q5hfOIvg0ZrJd11aJIZ4l5P6NKFm411zlCyb3JHpjSbW+HLUBx+LT
         d0Oj+NlY+rRuYHqwJkNMbuy4V+rX1ENj0xUv1ZPFswwq8FEYW+Go9s3paBc871FRSL+d
         cI8r+FD7KXmpNS++ceubiLuH2N0b1lKKlbfOqZ4lapeSCOAszQ49tVHfNDUkGs4QyFVb
         inIQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2wL1tunvjcu7wIembZBNch/IOVCbmQWY9hzlJCb3I11fY7/GpI4hvZ5ik9caB9W7zVAocMIktrArF3vtvfUGSRJ4ZYA==@lists.linux.dev
X-Gm-Message-State: AFuF++lV5PRloiN9b6xxhk2ILUfT4fNS7h43sZ/HyEcsxDRcPlRlnPvm
	loZ/7Ds+5zktyPj9qscGnuku6cSFhZhOQv7GHu/6pk5yq6/hpK+okAjsoDNt
X-Gm-Gg: AYBFou19tb3cTSTUgiUI510CDIRFga9sjCs+sS38aAOntOXCOzt2+jwYBSuDjJLWYJk
	6Fm8hQ35drmIdtadHOeOZvA7vXGSCdc9AeY3I0GALxjbuUwBqlGupzWV/VT7TyavRMSnSU1HG/t
	udllQT07IJlmu7Ky29Bdi7GadhDSUwRfD4M7vlncTydAD4wuoCtnPhR2GKdZnZjLD24pm5n5xOq
	QFVm94ZJ2W3K/hDeC/HtIKwwxTnoe/vPcuXxyU44iLrykWfGIBR14J0K0rnHX/1TceZb+iYwXK8
	7TBCUasL+G1jGZ15izEQoww5ETCBDR0/OsMS+hTzC1rsNlK3Fpuu13GlW6bffjQAik/mpjFiaHn
	MTeKMQgleGQzgRTsVWJeBzz/CphIVH/3ExIQeKGywuC/zjjmmSMzK+kgoS/D4Ss4wHo6RET23YZ
	tgmOlFC/SDTMNuulkiqFL/n2DxZ2wtv5CF9BOYSVufKbKuJYK2ADLOQ7/0VX1HwgUstOSLlncpH
	k1/BOaqBDEvI//YffgS3+RiqIk/PN3a5w==
X-Received: by 2002:a05:693c:6215:b0:33b:afc9:caa9 with SMTP id 5a478bee46e88-34274332a13mr17037361eec.38.1790697743023;
        Tue, 29 Sep 2026 09:02:23 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c350c0d0fsm329394eec.4.2026.09.29.09.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 09:02:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Sep 2026 13:02:16 -0300
Message-Id: <DLRXDBH5LB8G.24QDEEJWMGJG7@gmail.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Benno Lossin" <lossin@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Boqun Feng"
 <boqun@kernel.org>, "Brigham Campbell" <me@brighamcampbell.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Jori Koolstra"
 <jkoolstra@xs4all.nl>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Rae Moar" <raemoar63@gmail.com>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Tamir Duberstein" <tamird@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Yury Norov" <yury.norov@gmail.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>
Subject: Re: [PATCH 0/3] rust: kunit: support #[should_panic] and same test
 name with different #[cfg(...)]
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, "Alice
 Ryhl" <aliceryhl@google.com>, "Burak Emir" <burak.emir@gmail.com>, "Brendan
 Higgins" <brendan.higgins@linux.dev>, "David Gow" <david@davidgow.net>,
 "Miguel Ojeda" <ojeda@kernel.org>
X-Mailer: aerc 0.20.0
References: <cover.1790599486.git.nico.antinori.7@gmail.com>
In-Reply-To: <cover.1790599486.git.nico.antinori.7@gmail.com>

On Tue Sep 29, 2026 at 11:07 AM -03, Nicol=C3=A1s Antinori wrote:
> This patch series intends to implement two features for KUnit tests
> written in Rust. The work is based on a TODO comment made in the
> `bitmap.rs` module [1].
>
> Changelog:
> - RFC patch: [3]
>
> 1. Supporting `#[should_panic]` [2]:

For some reason, GMail is not letting me send the first patch of the
series as it marks it as spam. I'll check what happens and send a PATCH
RESEND of the series or reply this series with thah patch (I already
tried that and failed).

Apologies for the inconvenience.

Regards,
Nicol=C3=A1s=20

