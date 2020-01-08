Return-Path: <SRS0=o+/b=25=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A5EC282DD
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  8 Jan 2020 13:00:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A5B620643
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  8 Jan 2020 13:00:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A5B620643
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4F40F87999;
	Wed,  8 Jan 2020 13:00:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SK6x7OuCd0k9; Wed,  8 Jan 2020 13:00:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D758C877ED;
	Wed,  8 Jan 2020 13:00:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BDE9BC1796;
	Wed,  8 Jan 2020 13:00:46 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9DA13C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Jan 2020 13:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 844CF878A5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Jan 2020 13:00:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3+fhqe0q32DQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Jan 2020 13:00:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F2ACE877ED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Jan 2020 13:00:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,410,1571695200"; d="scan'208";a="430430169"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2020 14:00:40 +0100
Date: Wed, 8 Jan 2020 14:00:40 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200108113112.26209-1-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2001081359400.2069@hadrien>
References: <20200108113112.26209-1-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Linux-kernel-mentees] [PATCH] parsing_c: Handle case of
 annotation and ; or = after ident
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



On Wed, 8 Jan 2020, Jaskaran Singh wrote:

> For the following case:
>
> [const_vol] <type> [ptr] <identifier> <annotation> <semicolon|eq>
>
> The lookahead function in Parsing_hacks would mislabel <identifier> as a
> CppDirective.
>
> Add cases in the lookahead function for handling this case.
>
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>

Looks good.  There are a lot of __ro_after_inits that now get properly
recognized as attributes.  The patch is applied.

julia

> ---
>  parsing_c/parsing_hacks.ml | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/parsing_c/parsing_hacks.ml b/parsing_c/parsing_hacks.ml
> index 56857f3c..43421647 100644
> --- a/parsing_c/parsing_hacks.ml
> +++ b/parsing_c/parsing_hacks.ml
> @@ -1887,6 +1887,11 @@ let not_struct_enum = function
>      (Parser_c.Tstruct _ | Parser_c.Tunion _ | Parser_c.Tenum _)::_ -> false
>    | _ -> true
>
> +let is_struct_enum = function
> +  | (Parser_c.TIdent _)::
> +    (Parser_c.Tstruct _ | Parser_c.Tunion _ | Parser_c.Tenum _)::_ -> true
> +  | _ -> false
> +
>  let not_opar = function
>      TOPar _ -> false
>    | _ -> true
> @@ -2061,6 +2066,32 @@ let lookahead2 ~pass next before =
>  	&& is_type type_ ->
>  	  TCommentCpp (Token_c.CppDirective, i1)
>
> +	(* tt xx yy; : yy is an annot *)
> +  | (TIdent (s, i1)::(TPtVirg _|TEq _)::_, TIdent (s2, i2)::type_::rest)
> +    when (is_struct_enum (type_::rest)
> +	|| is_type type_)
> +	&& s ==~ regexp_annot ->
> +	  TCommentCpp (Token_c.CppMacro, i1)
> +
> +	(* tt * xx yy; : yy is an annot *)
> +  | (TIdent (s, i1)::(TPtVirg _|TEq _)::_, TIdent (s2, i2)::ptr)
> +    when pointer ptr
> +	&& s ==~ regexp_annot ->
> +	  TCommentCpp (Token_c.CppMacro, i1)
> +
> +	(* tt xx yy; : yy is an annot, so xx is an ident *)
> +  | (TIdent (s, i1)::TIdent (s2, i2)::(TPtVirg _|TEq _)::_, seen::_)
> +    when (is_struct_enum before
> +	|| is_type seen)
> +	&& s2 ==~ regexp_annot ->
> +	  TIdent (s, i1)
> +
> +	(* tt * xx yy; : yy is an annot, so xx is an ident *)
> +  | (TIdent (s, i1)::TIdent (s2, i2)::(TPtVirg _|TEq _)::_, ptr)
> +    when pointer ptr
> +	&& s2 ==~ regexp_annot ->
> +	  TIdent (s, i1)
> +
>  	(* tt xx yy *)
>    | (TIdent (s, i1)::TIdent (s2, i2)::_  , seen::_)
>      when not_struct_enum before
> --
> 2.21.1
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
