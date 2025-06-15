Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F454A33
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 15 Jun 2025 16:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750005999; cv=none; b=aocY2y1Nv+EopyeTpVOfj346W+SNK+jCXU4SQK+k9z+jZrj29vVSLafE+yJ83EMYlBSwPIKgdKawFapYOG8LZmjw8P0DiitVoIkFgsU6KNdfr/3wu+UwgcXk/jHkQ1mjLkIAEb8wL4OlIY3HWshvUzdDJMwX2lUoI0MSi8Vdccw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750005999; c=relaxed/simple;
	bh=SOWk6TIG82iLlaUhAgD9pKP2ZNabz8ANg/PmP0hCsz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NqYPhXb+K6JMpAO0kmQxLL4JmRbtbP/nZGyWNMT0n7axkm3WGwdhE85HzV0yH/C8ge53P5UIcRcftHrA9AaVX44RhOWAuUGjtQSL7p6NfZmUupoKgHNaODUPvkid2eCi6l+ExzQojhmPYAAlH2aaloueslVkoOaTzbiNj3g7i9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kub43L3f; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kub43L3f"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-313f928718eso724354a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 15 Jun 2025 09:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750005996; x=1750610796; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSY0daWpyZ03oAMbhCydcP6cPAqTJy9hG8mK7fwbpX8=;
        b=kub43L3fiW6kmkFId3sJNs64greUREbWOSqkrStHvKDt4dbvhijfbOwfPtWiNkK9h1
         iDxrg40JbLZAluh1IC83lEe27fkrlqvBtwjJNucu32/0kTJItpBZt2/Jv2wWVqBRqkcA
         ytB+sQ2wsMyrDjTmOZKPXtAoRuin7XBz0MA0qzKr8STesxpZRS2aJ/HYIH0nSLkirSqB
         1YUAZiB1E9JomT46Ia1CCGP6nK+mLLwjgUmnTwP2QVrxpxnHVSfyx6kAVRl0PFEEBb8F
         kRDl320rny48hus+etkMTtGZwke6T3RVHw9y9GU+Yk5gJ+H/8xsHxFvGaQ8oUk2Wtptv
         dA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750005996; x=1750610796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MSY0daWpyZ03oAMbhCydcP6cPAqTJy9hG8mK7fwbpX8=;
        b=sP6jNaPwmmuNlvIkYH+C7WPbct/ndJCMD9JycVqP3vs8sl2IRQm954jA8+2kVlUxJ2
         lg7CawpG7j4McpvO7B6n1o/oaQvSs9vdmcqsb9YQNMKrqJ7gE/qSd0DWyveiFaEGs5z8
         YHX/nln/wEcKaE0GA2Mbqa5kz/rpXfGr7TwRl/uE4C+uZ2JNWRonP7z3p2lrjqzkUjVn
         /QEZN+t+t+P/WBQGpYaVSRm9bnjYzPssfLC9WUm6JQccrnxFihGtC9tZ/0ElUeLgXp3b
         XST1z+gRdzQYa7dSXeOrI6ii1nEWdpkm9USVYfLPdbQsBmfOXJbefyiRoEQNFuuUdW/L
         f4BA==
X-Forwarded-Encrypted: i=1; AJvYcCXzMoF7JuJkdmL4io0rKHqOeMx7qQcInakqRNevu+r4jSNUcnuxKJUFuljhhrJUJe6MeM/xEsleltjQEvXdwZD5TFE7qg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywj2ak9jdHDq7bNz47pInydc44Wrt07/6QlT6kwlYU5gfshaEPC
	ugSlEljDy3Yv5LTker3zBNjta7ogA8TeJ1pT2zHKXB6sZu7xHRq2rN+6+J/lsYzcFl2EmOhjaOR
	3U20BVd6xePe//EaUEyeCIFj9nqcH/v7/cEh3xCI=
X-Gm-Gg: ASbGncuUq+M3kKjSsYSQSogNN7DP4nkHwsSk4VmIzZIotLDZ/7UUymmFsLh29jPUzSo
	oxwKWecVLTLHsZvjrFw3hD4wDJmbUGy7rBg3piAq4eBAQpFqCSagHzuaFAwkUzis3HXUNHguJND
	FELiUv/3dfa08LHSsUHtctNn6dpelEFp/ezF6dHyYPNd+PcA==
X-Google-Smtp-Source: AGHT+IHmFkN9t/ayfwW/2pRyDteHB4ds9y+n4OojpVIGKCmqVciCOQGygF8jZOaEtov35uzZK/fl8xhGTsPY5KgKxaw=
X-Received: by 2002:a17:90b:3d48:b0:313:f775:d381 with SMTP id
 98e67ed59e1d1-313f775d61amr9021269a91.18.1750005996430; Sun, 15 Jun 2025
 09:46:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250614185743.657564-1-bharadwaj.raju777@gmail.com>
 <bwga4jheevnhuwwpopfwbzsjsxvmte4mtybevkfgssem4zftjo@anj44i6sfyd4>
 <CAPZ5DTEtsqJ_z7OtRVKDqb+LkvS=UfNvCTUqnY2Pu6qGVs+PEQ@mail.gmail.com> <tqzma4qfw7ppu56mqucmekmuhtqs5raos6wrzddf7fjouaeb6g@himxw7j544tb>
In-Reply-To: <tqzma4qfw7ppu56mqucmekmuhtqs5raos6wrzddf7fjouaeb6g@himxw7j544tb>
From: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
Date: Sun, 15 Jun 2025 22:16:09 +0530
X-Gm-Features: AX0GCFsRX6NUr6vHSoY0j6jt3eTCfaK4V36fjjW-QrtFNGcCKr9KidwSRNaQcA8
Message-ID: <CAPZ5DTFoUAfgUwn_nqjTPUDhZ74=reuVZiX0d0fGPt=7LU07UQ@mail.gmail.com>
Subject: Re: [PATCH] bcachefs: don't return early from __btree_err for bad or
 incompatible node read errors
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: linux-bcachefs@vger.kernel.org, shuah@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	syzbot+cfd994b9cdf00446fd54@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 15, 2025 at 9:35=E2=80=AFPM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
> But then you're calling __bch2_topology_error()? When we're in
> scan_for_btree_nodes we're just checking if the node is readable, we
> shouldn't be doing anything that flags errors/recovery passes elsewhere.

Right, that makes sense. I originally put that in because the old
codepath would unset silent (which was set when in
scan_for_btree_nodes) only if __bch2_topology_error returned nonzero
in the case of bad_node.

> I think the correct fix would be more like
>
> if (scan_for_btree_nodes)
>         return ret =3D=3D -BCH_ERR_btree_node_read_err_fixable
>                 ? bch_err_throw(c, fsck_fix)
>                 : ret; /* or -BCH_ERR_btree_node_read_err_bad_node? */
>

Got it. I'll send the PATCH v2 then, thanks for the guidance!
