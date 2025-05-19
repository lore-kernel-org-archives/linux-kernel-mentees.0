Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948192749C8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 May 2025 11:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747654659; cv=none; b=V/mkxxryOeDIbjrXBtIxd9E9TT6eH8Nz3YWvAQh/bkZvb8btRfT4uJjjUbE7v1ZARDNcqqaojEQRG6WWQ1J2F4AVrpO9sOY9j5DeeSBAkdRaUETtR8GjHxhryJGzA9Ivysd5ta8lksR7dq+ijPI1+tSmGtYaLzYAt/1gPXa0MCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747654659; c=relaxed/simple;
	bh=aa1VISchFVQGEEO+PHHT8+XHayl0PsAfOAIwoXJWS4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MfS4zUklzqtLmO0ogsMvKfDFjyo6c18RYYIrHY1qNp6M/EUZXFL7C88xF8g4AJPXpRIqXcDxKwIFWwoTh6QVGpmg19hzlqZXy133jYjCE7y8O8gBXgi0Sy14vLJxY/StKxKiOqJp7LdEWdxVMh8cJRSgN2r8Nnt/nEbLBDKlGh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n634viO+; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n634viO+"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11C6A40BCD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 May 2025 11:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gEmv6U0eDTaJ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 May 2025 11:37:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=dakr@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2DD3040B7B
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DD3040B7B
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n634viO+
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2DD3040B7B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 May 2025 11:37:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 36F9861149;
	Mon, 19 May 2025 11:37:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 297BFC4CEE4;
	Mon, 19 May 2025 11:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747654654;
	bh=aa1VISchFVQGEEO+PHHT8+XHayl0PsAfOAIwoXJWS4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n634viO+7JvWOh6EFJUsdVpx+RXJwH4tY+jmEO7DDU9v30L4JOw3W6K8f0CbBo/4/
	 MTy4AdO66xs3r+GoNGv1U6nOj8BiyBpRmjdgFf7OuANPDwvPK+MR2AqTHur8dR7hq3
	 tXwbA1B3WdkwAu16ccaQGnyhosp2NW8eSGuVr57ISJp/Nq4BnJbHV7RYBrEfhHpFOS
	 /enpGrLBd2oUClAgNbQNAYAHl2aMj1h8GR+cx+C5TdPKtcEwl8tX9dq5XuYByv9Hdt
	 4lBcs/X7SMHr0fEZ7PJLgtd8G4g4ndh3VM6JS99yRHrMtvZhWldFyt1X7rkUffNCdX
	 astR9wyZkxUSw==
Date: Mon, 19 May 2025 13:37:30 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: Marcelo Moreira <marcelomoreira1905@gmail.com>, benno.lossin@proton.me,
	ojeda@kernel.org, rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH v2] rust: doc: Clarify safety invariants for Revocable
 type
Message-ID: <aCsX-k0K_jqLvD4e@pollux>
References: <20250503145307.68063-1-marcelomoreira1905@gmail.com>
 <D9RJQYNTIOK1.3HI7NDDWPK6IM@kernel.org>
 <aChczAWsPdmdeen3@pollux>
 <D9YO7XDNV712.3A5HSSLUQIZ2W@kernel.org>
 <aCrwuQP46RFHxYB5@pollux>
 <DA00X0RTYKMA.2OG25TZ1X3AU@kernel.org>
 <aCsAEJtkCKKhspnF@pollux>
 <DA03ANJMDOU2.1ZQWA6MIENVKD@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA03ANJMDOU2.1ZQWA6MIENVKD@kernel.org>

On Mon, May 19, 2025 at 01:10:32PM +0200, Benno Lossin wrote:
> On Mon May 19, 2025 at 11:55 AM CEST, Danilo Krummrich wrote:
> > On Mon, May 19, 2025 at 11:18:42AM +0200, Benno Lossin wrote:
> > Why not? Please show me a case where `is_available` is false, but I can still
> > technically access data (without violating a safety requirement).
> 
>     let r: Arc<Revocable<i32>> = ...;
>     let guard = r.try_access().unwrap(); // nobody else is holding a reference, so this can't fail
> 
>     let r2 = r.clone();
> 
>     // I know we don't have threads, but I don't want to have to look up
>     // how to use the workqueue or something else...
>     thread::spawn(move || {
>         r2.revoke();
>     });
> 
>     for _ in 0..10_000_000 {
>         // do some non-sleeping work that takes a while
>     }
> 
>     // now the thread above has executed `self.is_available.swap(false, Ordering::Relaxed)`
>     // in `revoke_internal` and is waiting for the `synchronize_rcu` call to return.
>     // but we can still access `guard`:
> 
>     pr_info!("{}", &*guard);

Which is perfectly correct, you're right. I think I was too focused on the
optimization case. :-)

> > However, this invariant does not need to be fulfilled for access() and
> 
> Where is `access()` defined?

https://gitlab.freedesktop.org/drm/nova/-/commit/46f91addfabbd4109fb64876a032ae4a4a924919

> > revoke_nosync(), because it would circumvent their purpose, i.e. cases where an
> > abstraction can prove that there can't be a concurrent user of the data or a
> > concurrent user revoking the data respectively.
> 
> Yes. How about something like "`data` is valid while `is_available` is
> true. It also is valid if the RCU read-side lock is being held and it
> was taken while `is_available` was true."?
> 
> That should also cover the "nobody else is accessing this" case.

Sounds good to me!

> > An example of revoke_nosync() is the original Devres implementation [1].
> > However, this was re-worked with [2] to use a different logic that doesn't need
> > revoke_nosync() anymore.
> >
> > Actually, "doesn't need revoke_nosync()" isn't exactly true. We would still
> > benefit from revoke_nosync(), but the implementation in [2] triggers the devres
> > C callback from drop() and the devres C callback calls revoke().
> >
> > If we'd had a way to know that the devres C callback has been triggered due
> > drop(), we could use revoke_nosync() in this case as an optimization.
> 
> Yeah that sounds like a plausible option. Given that, I think the
> following kind of function could be useful on `Revocable`: a safe
> `revoke_` function that takes `&mut self` and thus doesn't need to use
> RCU (since we have a unique mutable reference, only we have access).
> 
> Do you have any other uses of `revoke_nosync` that do not have
> (potential) access to `&mut Revocable`?

I could imagine abstractions that use Revocable with some external lock
protecting the data for instance. But this could probably be solved otherwise
with LockedBy.

> > [1] commit 76c01ded724b ("rust: add devres abstraction")
> > [2] commit 8ff656643d30 ("rust: devres: remove action in `Devres::drop`")
