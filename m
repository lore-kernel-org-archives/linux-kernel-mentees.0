Return-Path: <SRS0=gpyO=6R=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A11FCC28CBC
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  3 May 2020 19:28:27 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 724512054F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  3 May 2020 19:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 724512054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5215486449;
	Sun,  3 May 2020 19:28:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AgUIoW7RkcBC; Sun,  3 May 2020 19:28:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2928585F57;
	Sun,  3 May 2020 19:28:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1442AC0176;
	Sun,  3 May 2020 19:28:26 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0B6DC0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 May 2020 19:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C31CC88548
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 May 2020 19:28:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aB14OjLsGhph
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 May 2020 19:28:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E9E8288528
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 May 2020 19:28:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.73,349,1583190000"; d="scan'208";a="347593895"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 May 2020 21:28:22 +0200
Date: Sun, 3 May 2020 21:28:21 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200428170228.7002-10-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2005032127520.2533@hadrien>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
 <20200428170228.7002-10-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, linux-kernel-mentees@lists.linuxfoundation.org,
 cocci@systeme.lip6.fr
Subject: Re: [Linux-kernel-mentees] [PATCH 09/32] parsing_cocci: arity:
	Reflect Cast attributes
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>



On Tue, 28 Apr 2020, Jaskaran Singh wrote:

> Cast attributes are added to the SmPL AST. Reflect these changes in
> arity.ml.
>
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> ---
>  parsing_cocci/arity.ml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/parsing_cocci/arity.ml b/parsing_cocci/arity.ml
> index 8ee6d33f..880cd7a3 100644
> --- a/parsing_cocci/arity.ml
> +++ b/parsing_cocci/arity.ml
> @@ -254,13 +254,14 @@ let rec top_expression opt_allowed tgt expr =
>        let ar = mcode ar in
>        let field = ident false arity field in
>        make_exp expr tgt arity (Ast0.RecordPtAccess(exp,ar,field))
> -  | Ast0.Cast(lp,ty,rp,exp) ->
> +  | Ast0.Cast(lp,ty,attr,rp,exp) ->
>        let arity = exp_same (mcode2line lp) [mcode2arity lp;mcode2arity rp] in
>        let lp = mcode lp in
>        let ty = typeC arity ty in
> +      let attr = List.map mcode attr in

Since attrs are mcodes, they should be reflected in the list that is given
to exp_same.

julia


>        let rp = mcode rp in
>        let exp = expression arity exp in
> -      make_exp expr tgt arity (Ast0.Cast(lp,ty,rp,exp))
> +      make_exp expr tgt arity (Ast0.Cast(lp,ty,attr,rp,exp))
>    | Ast0.SizeOfExpr(szf,exp) ->
>        let arity = exp_same (mcode2line szf) [mcode2arity szf] in
>        let szf = mcode szf in
> --
> 2.21.1
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
